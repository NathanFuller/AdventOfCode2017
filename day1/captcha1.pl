#!/usr/bin/perl
 use strict;
 use warnings;

open(my $fin, "<", "/Users/nathanfuller/adventOfCode/nums.txt")
	|| die "$!";

my $number = <$fin>;

my $total = 0;
my $length = length($number);
my $dist = ($length-1)/2;
print "Length:\n";
print $length;
print "\nDist:\n";
print $dist;
print "\n";

foreach (0 .. $dist-1){
	my $this = substr $number, $_, 1;
	my $next = substr $number, $_+$dist, 1;
#	if ($_<$length-2){
#		$next = substr $number, $_+1, 1; 
#	}
#	else {
#		$next = substr $number, 0,1;
#	}
	if ($this == $next){
		$total += $this*2;
	}
}
print "The total is:\n";
print $total;
print "\n";
