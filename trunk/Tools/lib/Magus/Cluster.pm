package Magus::Cluster;
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
# $MidnightBSD: mports/Tools/lib/Magus/Result.pm,v 1.3 2007/10/23 03:58:51 ctriv Exp $
# 
# MAINTAINER=   ctriv@MidnightBSD.org
#



use strict;
use warnings;


sub halt {
  _send_tasks('Wait');
}

sub resume {
  $_->complete(1) for Magus::Tasks->search(type => wait);
}


sub run_task {
  my ($type) = @_;
  
  _send_tasks($type);
  
  my $running_count = 1;
  
  while ($running_count > 0) {
    $running_count = Magus::Task->search(type => $type, complete => 0)->count;  
  }
}
  
   
sub _send_task {
  my ($type) = @_;
  
  foreach my $machine (Magus::Machine->retrive_all) {
    next if $machine eq $Magus::Machine;
    
    Magus::Task->insert({
      machine => $machine,
      type    => $type
    });
  }
}

1;
__END__

