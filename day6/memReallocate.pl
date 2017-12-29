#!/usr/bin/perl
use strict;
use warnings;

my @banks = (0,2,7,0);

sub findWhereMax { #takes a list, returns the index of the maximum element.
	my $index = 0;
	foreach my $check (1..$#_){
		if ($_[$check] > $_[$index]){
			$index = $check;
		}
	}
	return $index;
}

print findWhereMax @banks;

