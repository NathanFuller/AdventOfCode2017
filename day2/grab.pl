#Note: This doesn't work for this project because inputs
#differ by user and I would have to log in.
#I could try later in the Advent of Code to log in using this
#and get my input back.

#!/usr/bin/perl
use strict;
use warnings;

my $url = "http://adventofcode.com/2017/day/2/input";

use LWP::Simple;
my $doc = getprint($url);
die "Couldn't get it!" unless defined $doc;

