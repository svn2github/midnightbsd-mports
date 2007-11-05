package Magus::Index;
#
# Copyright (c) 2007 Chris Reinhardt. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
# 1. Redistributions of source code must retain the above copyright notice
#    this list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
# INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
# COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
# NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
# THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# $MidnightBSD: mports/Tools/lib/Magus/Index.pm,v 1.5 2007/11/05 16:54:49 ctriv Exp $
# 
# MAINTAINER=   ctriv@MidnightBSD.org
#

use strict;
use warnings;

use Mport::Utils qw(make_var recurse_ports);
  
use YAML qw(Load);
 
sub sync {
  my ($class) = @_;
  my %visited;
  my $root = "$Magus::Config{MasterDataDir}/$Magus::Config{MportsCvsDir}";
  local $| = 1;

  
  recurse_ports {
    print @_, "...";
    
    my $yaml = `PORTSDIR=$root BATCH=1 PACKAGE_BUILDING=1 MAGUS=1 make describe-yaml`;
    my %dump;
    
    eval {
      %dump = %{ Load($yaml) };
    };
    
    if ($@) {
      warn "Unable to parse yaml for $_[0]: $@\n";
      return;
    }
    
    my $port = Magus::Port->find_or_create({ name => $dump{name} });
    
    $port->version($dump{version});
    $port->description($dump{description});
    $port->pkgname($dump{pkgname});
    $port->license($dump{license});
    $port->update;
    
    $class->sync_depends(\%dump, $port);
    $class->sync_categories(\%dump, $port);
    
    if ($dump{is_interactive} && !$port->current_result) {
      print "\n\tIGNORE set.  Marking as skippped.\n";
      $port->set_result_skip(index => IsInteractive => "Port is marked as interactive.");
    }
  
    print " done\n";
    $visited{$port->name}++;
  } root    => $root,
    nochdir => sub { 
      (my $name = $_[0]) =~ s:.*/(.*?/.*?)$:$1:;
      my $port = Magus::Port->find_or_create({name => $name});

      $port->set_result_fail(index => BadDirMakefile => "$port does not exist but is in the directory makefile.");

      $visited{$name}++;
      print "\n\tUnable to chdir to  $_[0].  Marking as failure.\n";
    };      

  my $ports = Magus::Port->retrieve_all;
  
  # if the port is in the database, but not in the tree, then we need to delete it
  # from the database.
  print "Checking for deleted ports...";
  while (my $port = $ports->next) {
    if (!$visited{$port->name}) {
      print "\n\t$port";
      $port->delete;
    }
  }
  print "done\n";
}


sub sync_categories {
    my ($class, $dump, $port) = @_;
    
    Magus::PortCategory->search(port => $port)->delete_all;
    
    for (@{$dump->{'categories'}}) {
      my $cat = Magus::Category->find_or_create({ category => $_});
      $port->add_to_categories({ category => $cat });
    }
}
  
sub sync_depends {
  my ($class, $dump, $port) = @_;
  
  # We only have one depend type, merge into a unique list
  my %depends;
  while (my ($type, $deps) = each %{$dump->{'depends'}}) {
    foreach my $dep (@$deps) {
      $depends{$dep}++;
    }
  }
  
  Magus::Depend->search(port => $port)->delete_all;
  
  foreach my $dep (keys %depends) {
    $port->add_to_depends({ dependency => $dep });
  }
}  
       

   
1;
__END__
 