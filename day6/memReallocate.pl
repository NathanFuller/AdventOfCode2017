#!/usr/bin/perl
use strict;
use warnings;

my @banks = (0,2,7,0);

sub findWhereMax {	#takes a list, returns the index of the maximum element.
	my $index = 0;
	foreach my $check (1..$#_){
		if ($_[$check] > $_[$index]){
			$index = $check;
		}
	}
	return $index;
}

sub findInList {	#give it a target and a list. Returns 1 if target is in list and 0 if not.
	my $target = shift;
	foreach my $str (@_){
		return 1 if ($str eq $target);
	}
	return 0;
}

my $continue = 1;
my $stepCounter = 0;

print "The string \"3\" is ";
print "not " unless findInList("3", @banks);
print "in the list.\n";
