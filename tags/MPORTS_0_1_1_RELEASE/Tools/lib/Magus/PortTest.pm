package Magus::PortTest;
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
# $MidnightBSD: mports/Tools/lib/Magus/Chroot.pm,v 1.3 2007/09/06 04:22:38 ctriv Exp $
#
# MAINTAINER=   ctriv@MidnightBSD.org
#

use strict;
use warnings;

use File::Path qw(mkpath);

use Mport::Globals qw($MAKE);
use Magus::OutcomeRules ();

=head1 NAME 

Magus::PortTest

=head1 SYNOPSIS

  
=head1 DESCRIPTION

This class handles the actual testing of a single port.  It does not attempt
to install depends, or setup the chroot.  It simply runs a port, and
interpretes the results.

B<This class expects the chroot dir to be /.  Always chroot before using this
class.>

=head1 METHODS

=head2 Magus::PortTest->new(port => $port, chroot => $chroot)

Creates a new tester object.  

=cut

sub new {
  my ($class, %args) = @_;

  my $self = bless {
    %args,
    uid => "$args{port}:" . time,
  }, $class;

  $self->{logdir} = join('/', $self->{chroot}->logs, $self->{uid});
  mkpath($self->{logdir}) || die "Couldn't mkdir $self->{logdir}: $!\n";
  
  return $self;
}

=head2 my @results = $test->run

Runs the test and returns a data structure representing the results.

=cut

sub run {
  my ($self) = @_;
  
  $self->_set_env;
  $self->{chroot}->mark_dirty;

  my %results;
  
  foreach my $target (qw(fetch extract patch configure build fake package install deinstall reinstall)) {
    if (!$self->_run_make($target)) {
      push(@{$results{errors}}, {
        phase => $target,
        msg   => "make $target returned non-zero: $?",
        name  => "MakeExitNonZero",
      });
      
      $results{summary} = 'fail';
    }
    
    my $testclass = "Magus::OutcomeRules::$target";
    
    my $presults = $testclass->test("$self->{logdir}/$target");

    $results{summary} = $presults->{summary} if $presults->{summary} eq 'fail';
        
    if ($presults->{errors}) {
      push(@{$results{errors}}, @{$presults->{errors}});
    }
    
    if ($presults->{warnings}) {
      push(@{$results{warnings}}, @{$presults->{warnings}});
    }
    
    if ($presults->{summary} eq 'fail') {
      last;
    }
  }
  
  $results{summary} ||= 'pass';
  
  return \%results;
}


sub _run_make {
  my ($self, $target) = @_;
  
  chdir($self->{port}->origin);

  return system("$MAKE $target >$self->{logdir}/$target 2>&1") == 0;
}  


sub _set_env {
  my ($self) = @_;
  
  $ENV{PACKAGES}       		= $self->{chroot}->packages;
  $ENV{WRKDIRPREFIX}  		= $self->{chroot}->workdir;
  $ENV{DEPENDS_TARGET} 		= 'magus-broken-depend';
  $ENV{DISTDIR}        		= $self->{chroot}->distfiles;
  $ENV{MAGUS}          		= 1;
  $ENV{BATCH}	       		= 1;
  $ENV{MPORT_MAINTAINER_MODE} 	= 1;
  $ENV{PACKAGE_BUILDING}	= 1;
  $ENV{TRYBROKEN}		= 1;
}


1;
__END__



