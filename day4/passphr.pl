#!/usr/bin/perl
use strict;
use warnings;

open(my $fin, "<", "/Users/nathanfuller/adventOfCode/day4/list.txt")
	|| die "$!";

my $total = 0;
while (my $line = <$fin>){
	my $isValid = 1;
	my @words = (split /\s/, $line);
	foreach (@words){
		$_ = join('', sort split(//,$_)); 
		print "$_\n";
	}
	print "\n";
	@words = sort @words;
	foreach (0..$#words-1){
		if ($words[$_] eq $words[$_+1]){
			$isValid = 0;
		}	
	}
	$total += $isValid;

}

print "Total: $total\n";
#not 310
