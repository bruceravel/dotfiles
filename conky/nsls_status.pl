#!/usr/bin/perl
use strict;
use warnings;
use autodie qw(open close);

use Regexp::Common;
use Readonly;
Readonly my $NUMBER   => $RE{num}{real};


#$ENV{http_proxy} = http://192.168.1.130:3128/
use LWP::Simple;

my $xrcurr = get 'http://status.nsls.bnl.gov/Status/Readback/xrcurr';
my $current = (split(" ", $xrcurr))[0];

my $xbeamavail = get 'http://status.nsls.bnl.gov/Status/Readback/xbeamavail';
my $available = sprintf("%d", $xbeamavail);


# my $doc = get 'http://status.nsls.bnl.gov/cgi-bin/web_xr_beaminfo2.pl';

# my ($current, $energy, $available) = (0,0,0);

# my @lines = split(/\n/, $doc);
# while (@lines) {
#   my $l = shift @lines;
#   if ($l =~ m{Current}) {
#     my $next = shift @lines;
#     $current = $1 if ($next =~ m{($NUMBER)});
#   } elsif ($l =~ m{Energy}) {
#     my $next = shift @lines;
#     $energy = $1 if ($next =~ m{($NUMBER)});
#   } elsif ($l =~ m{Beam available}) {
#     my $next = shift @lines;
#     $available = $1 if ($next =~ m{($NUMBER)});
#   };
# };

open my $C, ">/home/bruce/.conky/nsls_current";
print $C $current;
close $C;

open my $A, ">/home/bruce/.conky/nsls_available";
($available) ? print $A 'yes' : print $A 'no';
close $A;
