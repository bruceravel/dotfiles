#!/usr/bin/perl
use strict;
use warnings;
use LWP::Simple;

my $xrcurr = get 'http://status.nsls.bnl.gov/Status/Readback/xrcurr';
my $current = (split(" ", $xrcurr))[0];
print $current;
