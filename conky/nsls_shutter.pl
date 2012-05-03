#!/usr/bin/perl

## this crude script fetches the graphic from
##    http://status.nsls.bnl.gov/Status/xstat.html
## then examines a pixel in the X23A2 box.  If it is green, the word
## "open" is written.  If not green, "closed" is written.

use strict;
use warnings;
use autodie qw(open close);

use Image::Imlib2;
use LWP::Simple;

my $gif = get 'http://status.nsls.bnl.gov/Status/images/Xstat.gif';
open my $G, ">/home/bruce/.conky/Xstat.gif";
print $G $gif;
close $G;

my $i = Image::Imlib2->load("/home/bruce/.conky/Xstat.gif");
# this is a pixel in X23A2's box
my ($r, $g, $b, $a) = $i->query_pixel(653,279);

(($r == 0) and ($g == 255) and ($b == 0)) ? print "open" : print "closed";

