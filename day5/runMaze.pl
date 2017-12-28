#!/usr/bin/perl
use strict; use warnings;


open(my $fin, "<", "/Users/nathanfuller/adventOfCode/day5/maze.txt")
	|| die "$!";

my @maze = <$fin>;

my $continue = 1;
my $pos = 0;
my $stepCounter = 0;
while ($continue){
	my $jump = $maze[$pos];
	if ($jump>=3){
		$maze[$pos] -=1;
	}else{
		$maze[$pos] +=1;
	}
	my $newpos = $pos + $jump;
	if ($newpos > $#maze or $newpos < 0){
		$continue = 0;	
	}else {
		$pos = $newpos;
	}
	
	$stepCounter += 1;
}

print "$stepCounter steps\n";
