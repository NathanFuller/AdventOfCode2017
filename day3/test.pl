#!/usr/bin/perl
use strict;
use warnings;


sub doStuff {
	my ($string, $num) = @_;
	return $string;
}


print doStuff("hi", 5) unless "true";

sub printGrid {
	my @g = (@_);
	foreach my $arref (@g){
		foreach my $l (@$arref){
		 print $l;
		 print "\t";
	 }
	 print "\n";
 }
}


my @grid;

my @row = (0, 0, 0, 0, 0);

for (0..2){
	$grid[$_] = [@row];
}

printGrid @grid;

print "\n";

