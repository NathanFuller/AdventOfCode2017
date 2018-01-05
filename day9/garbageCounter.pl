#!/usr/bin/perl
use strict;
use warnings;

open (my $fin, "<", "/Users/nathanfuller/adventOfCode/day9/info.txt")
	|| die "$!";


my $stream = <$fin>;

print "Initial State:\t$stream\n";

$stream =~ s/!\S//g;
print "After step 1:\t$stream\n";

my @garbage = $stream =~ /(<[^>]*>)/g;
my $count = 0;
foreach (@garbage){
	my @chars = split //, $_;
	my $nchars = @chars - 2;
	print "$_\t$nchars\n";
	$count += $nchars;
}

print "Garbage counted: $count\n";
