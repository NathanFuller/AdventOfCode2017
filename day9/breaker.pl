#!/usr/bin/perl
use strict;
use warnings;

open (my $fin, "<", "/Users/nathanfuller/adventOfCode/day9/info.txt")
	|| die "$!";


my $stream = <$fin>;

print "Initial State:\t$stream\n";

$stream =~ s/!\S//g;
print "After step 1:\t$stream\n";

$stream =~ s/<.*>//g;
print "After step 2:\t$stream\n";
