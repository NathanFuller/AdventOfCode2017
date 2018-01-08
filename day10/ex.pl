#!/usr/bin/perl
use strict;
use warnings;

open (my $fin, "<", "test.txt")
	|| die "$!";

my $listsize = 5;
#my $listsize = 256;
my @list;
$list[0] = "zero";
$list[1] = "one";
$list[2] = "two";
$list[3] = "three";
$list[4] = "four";


sub getSlice {
	#I want this to return the proper slice given the current position and the length.
	#Wrapping around to the front should happen here.

	my ($sliceSize, $curpos, @list) = @_;
	#Don't worry - perl won't change these references.
	my @sliceEls;
	my $count = 0;

	while ($curpos <= $#list and $count < $sliceSize){
		#put curpos into sliceEls and increment count
		$sliceEls[$count] = $curpos;
		$curpos++;
		$count++;
	}
	#reset curpos to 0
	$curpos = 0;
	while ($count < $sliceSize){
		#fill in rest of sliceEls
		$sliceEls[$count] = $curpos;
		$curpos++;
		$count++;
	}
	
	return @sliceEls;
}



my @slice = getSlice(3, 0, @list);
print "First slice is 3 long and starts at zero.\n";
print @list[@slice];
print "\nNext slice is 4 long and starts at 3.\n";
@slice = getSlice(4, 3, @list);
print @list[@slice];
print "\nAnother slice is 2 long and starts at 4.";
@slice = getSlice(2, 4, @list);
print @list[@slice];


my @backwards = reverse @list[@slice];
print "\nHere is the last one backwards\n";
print @backwards;
print "\n";

sub circleAdd{
	#Given three numbers, returns the first two modulo the third.
	my ($add1, $add2, $listsize) = @_;
	my $sum = $add1+$add2;
	$sum -= ($listsize+1) if ($sum > $listsize);
	return $sum;
}

print @list[circleAdd(4, 2, $#list)];


print ord ",";

foreach (0..30){
	print "0 mod $_ is ";
	print 0 ^ $_;
	print "\n";
}
print "\n";
