#!/usr/bin/perl
use strict;
use warnings;

open (my $fin, "<", "/Users/nathanfuller/adventOfCode/day8/test.txt")
	|| die "$!";

my %registers;

while (my $instruction = <$fin>){
	if ($instruction =~ /([a-z]+) (inc|dec) (-?\d+) if ([a-z]+) (==|!=|<|>|<=|>=) (-?[\d]+)/){
		#$1 register to modify $2 inc or dec $3 how much $4-6 condition
		print "Reg: $1\nI/D: $2\nHow Much: $3\nIf ($4) ($5) ($6)\n";
		if ($registers{$1}){
			print "$1 already exists\n";
		}else{
			$registers{$1} = {
				myval => 0,
			}
		}
		
		if ($registers{$4}){
			print "$4 already exists\n";
		} else {
			$registers{$4} = {
				myval => 0,
			}
		}
		








		if ($5 eq "=="){
			if ($registers{$4}{myval} == $6){
				$registers{$1}{myval} += $3 if $2 eq "inc";
				$registers{$1}{myval} -= $3 if $2 eq "dec";
			}
		}

		if ($5 eq ">="){
			if ($registers{$4}{myval} >= $6){
				$registers{$1}{myval} += $3 if $2 eq "inc";
				$registers{$1}{myval} -= $3 if $2 eq "dec";
			}
		}

		if ($5 eq "!="){
			if ($registers{$4}{myval} != $6){
				$registers{$1}{myval} += $3 if $2 eq "inc";
				$registers{$1}{myval} -= $3 if $2 eq "dec";
			}
		}

		if ($5 eq "<="){
			if ($registers{$4}{myval} <= $6){
				$registers{$1}{myval} += $3 if $2 eq "inc";
				$registers{$1}{myval} -= $3 if $2 eq "dec";
			}
		}

		if ($5 eq "<"){
			if ($registers{$4}{myval} < $6){
				$registers{$1}{myval} += $3 if $2 eq "inc";
				$registers{$1}{myval} -= $3 if $2 eq "dec";
			}
		}

		if ($5 eq ">"){
			if ($registers{$4}{myval} > $6){
				$registers{$1}{myval} += $3 if $2 eq "inc";
				$registers{$1}{myval} -= $3 if $2 eq "dec";
			}
		}

		print "After change: $1 is $registers{$1}{myval}\n";
		print "\n";
	}
}

my @allregs = values %registers;
@allregs = sort {$a{myval} <=> $b{myval}} @allregs;
print "Largest value: $allregs[$#allregs]\n";
