#!/usr/bin/perl
use strict;
use warnings;
use LWP::Simple;
use Text::Wrap;
$Text::Wrap::columns=40;
my $xrmsg = get 'http://status.nsls.bnl.gov/Status/Readback/xrmsg';
print wrap(q{}, q{}, $xrmsg);
