#!/usr/bin/perl
use strict;
use warnings;

#my @banks = (0,2,7,0);
my @banks = (4,	10,	4,	1,	8,	4,	9,	14,	5,	1,	14,	15,	0,	15,	3,	5);

sub findWhereMax {	#takes a list, returns the index of the maximum element.
	my $index = 0;
	foreach my $check (1..$#_){
		if ($_[$check] > $_[$index]){
			$index = $check;
		}
	}
	return $index;
}

sub isInList {	#give it a target and a list. Returns 1 if target is in list and 0 if not.
	my $target = shift;
	foreach my $str (@_){
		return 1 if ($str eq $target);
	}
	return 0;
}

sub findWhere {	#given a target and a list, returns the index where the target can be found.
	my $target = shift;
	my $loc;
	foreach (0..$#_){
		$loc =  $_ if ($_[$_] eq $target);
	}
	return $loc;
}

my $continue = 1;
my $stepCounter = 0;
my @stateTracker;
	$stateTracker[0] = join ",", @banks;
print $stateTracker[0], "\n";

my $beginLoop;

while ($continue){
	my $pos = findWhereMax(@banks);
	my $numBlocks = $banks[$pos];
	$banks[$pos] = 0;
	while($numBlocks>0){
		if ($pos < $#banks){
			$pos += 1;
		} else {
			$pos = 0;
		}
		$banks[$pos] += 1;
		$numBlocks -= 1;
	}
	my $state = join ",", @banks;
	if (isInList $state, @stateTracker){
		$continue = 0;
		$beginLoop = findWhere($state, @stateTracker);
	}else{
		push @stateTracker, ($state);
	}
	$stepCounter += 1;
}

print "Number of reallocations: $stepCounter\n";
print "Length of infinite loop: ", $stepCounter - $beginLoop, "\n";
