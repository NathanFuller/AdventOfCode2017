#!/usr/bin/perl
use strict;
use warnings;

open (my $fin, "<", "test.txt")
	|| die "$!";

my $lengthline = <$fin>;
my @lengths = split(/,/, $lengthline);

my $listsize = 5;
#my $listsize = 256;
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

foreach my $len (@lengths){
	
}
