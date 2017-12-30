#!/usr/bin/perl
use strict;
use warnings;

open(my $fin, "<", "/Users/nathanfuller/adventOfCode/day7/info.txt")
	|| die "$!";

my %tree;

while (my $line = <$fin>){
	if ($line =~ /([a-z]+)\s\(([0-9]+)\)\s(->\s)?([a-z, ]+)?/){
		$tree{$1} = {
			weight => $2,
		};
		$tree{$1}->{children} = [split /, /,$4] if ($4); 
	}
}

#The following is how to get at an element in the array of children:
# $tree{name}->{children}[0];

sub getSubtreeWeight {	
	my $name = shift;
	my $total = getWeight($name);
	if  (getnumChildren($name) > 0){
		foreach my $child (getChildren($name)){
			$total += getSubtreeWeight($child);
		}
	}
	return $total;
}

sub getChildren{
	my $name = shift;
	return @{$tree{$name}{children}};	#THIS IS WHAT I NEEDED. THIS RIGHT HERE.
}

sub getnumChildren {
	my $key = shift;
	return 0 unless $tree{$key}{children};
	
	my $num = getChildren($key);
	return $num;
}

sub getWeight{
	my $key = shift;
	return $tree{$key}{weight};
}


sub printTree {
	my ($name, $depth) = @_;
	foreach (1..$depth){
		print "\t|";	
	}
	print "(${\getSubtreeWeight($name)}) $name: (${\getWeight($name)})\n"; 
	if (getnumChildren($name) > 0){
		foreach my $child (getChildren($name)){
			printTree($child, $depth+1);
		}
	}
}

printTree("uownj", 0);
