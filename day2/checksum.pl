+#!/usr/bin/perl
use strict; 
use warnings;

open(my $fin, "<", "/Users/nathanfuller/adventOfCode/day2/nums.txt")
	|| die "$!";

#my $number = <$fin>;

my $total = 0;
while (<$fin>){
	my @row = split (/\s+/, $_);
	my @sortedRow = sort {$a <=> $b} @row;
	$total += ($sortedRow[$#sortedRow]-$sortedRow[0]);
}


close $fin or die "$fin: $!";

#Note: NOT 24270 (too low)
#or 109305 (too high.)
print "Total:\n$total\n";
