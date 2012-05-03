#!/usr/bin/perl
use strict;
use warnings;
use LWP::Simple;
my $xbeamavail = get 'http://status.nsls.bnl.gov/Status/Readback/xbeamavail';
my $available = sprintf("%d", $xbeamavail);
($available) ? print 'yes' : print 'no';
