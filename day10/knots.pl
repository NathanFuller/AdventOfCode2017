#!/usr/bin/perl
use strict;
use warnings;

open (my $fin, "<", "info.txt")
	|| die "$!";

my $lengthline = <$fin>;
my @lengths = split(/,/, $lengthline);

#my $listsize = 5;
my $listsize = 256;
my @list;
foreach (0..$listsize-1){
	$list[$_] = $_;
	print "List[$_] = $list[$_]\n";
}

foreach (@lengths){
	print "Length: $_\n";
}

my $currentpos = 0;
my $skipsize = 0;

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

sub circleAdd{
	#Given three numbers, returns the first two modulo the third.
	my ($add1, $add2, $listsize) = @_;
	my $sum = $add1+$add2;
	$sum -= ($listsize+1) if ($sum > $listsize);
	return $sum;
}


foreach my $len (@lengths){
	if ($len>$#list+1){
		print "Error! Bad length $len.\n\n";
		last;
	}
	my @slice = getSlice($len, $currentpos, @list);
	@list[@slice] = reverse (@list[@slice]);
	foreach my $thing (@list){
		print "$thing\t";
	}
	print "\n\n";
	$currentpos = circleAdd $currentpos, $len+$skipsize, $#list;
	$skipsize++;
}


print "Product of first two elements is ";
print $list[0] * $list[1];
print "\n";
