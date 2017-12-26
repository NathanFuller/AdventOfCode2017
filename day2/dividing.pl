#!/usr/bin/perl
use strict; 
use warnings;

open(my $fin, "<", "/Users/nathanfuller/adventOfCode/day2/nums.txt")
	|| die "$!";


my $total = 0;
while (<$fin>){
	my @row = split (/\s+/, $_);
	foreach my $num (@row){
		foreach my $den(@row){
			my $div = $num/$den;
				#Note: This is a super cool thing that uses a regex to 
				# see if the result of the division is a whole number.
			if ($div != 1 and $div =~ /^\d+\z/){
				$total += $div;
				print ($div);
				print "\n";
			}
		}
	}
}


close $fin or die "$fin: $!";

print "Total:\n$total\n";
