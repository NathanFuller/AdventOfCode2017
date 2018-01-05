#!/usr/bin/perl
use strict;
use warnings;

open (my $fin, "<", "/Users/nathanfuller/adventOfCode/day9/test.txt")
	|| die "$!";


my $stream = <$fin>;

print "Initial State:\t$stream\n";

$stream =~ s/!\S//g;
print "After step 1:\t$stream\n";

my @garbage = $stream =~ /(<[^>]*>)/g;
foreach (@garbage){
	my @chars = split //, $_;
	my $nchars = @chars - 2;
	print "$_\t$nchars\n";
}

