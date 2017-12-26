#!/usr/bin/perl
use strict; 
use warnings;

my $countTo = shift @ARGV;
my @grid; 


##############Subroutines!!!!################
sub rootOfNextSquare {
	my $target = shift;
	my $n = 1;
	while ($target > $n*$n){
		$n+=1;
	}
	return $n;
}

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


sub look {
	my ($dir, $locy, $locx) = @_;
	if ($dir eq "^" and $locy != 0){
		return $grid[$locy-1][$locx];
	}
	
	if ($dir eq "v" and $locy < $#grid){
		return $grid[$locy+1][$locx];
	}
	if ($dir eq "<" and $locx != 0){
		return $grid[$locy][$locx-1];
	}
	if ($dir eq ">" and $locx < $#grid){
		return $grid[$locy][$locx+1];
	}
	if ($dir eq "ul" and $locy != 0 and $locx != 0){
		return $grid[$locy-1][$locx-1];
	}
	if ($dir eq "ur" and $locy != 0 and $locx < $#grid){
		return $grid[$locy-1][$locx+1];
	}
	if ($dir eq "dl" and $locy < $#grid and $locx != 0){
		return $grid[$locy+1][$locx-1];
	}
	if ($dir eq "dr" and $locy < $#grid and $locx < $#grid){
		return $grid[$locy+1][$locx+1];
	}
	
	return 0;
}


sub move {
	my ($dir, $locy, $locx) = @_;
	if ($dir eq "^"){
		return ($locy-1,$locx);
	}
	
	if ($dir eq "v"){
		return ($locy+1,$locx);
	}
	if ($dir eq "<"){
		return ($locy,$locx-1);
	}
	if ($dir eq ">"){
		return ($locy,$locx+1);
	}
}

sub taxiDistance {
	my ($y1, $x1, $y2, $x2) = @_;
	return abs($y1-$y2) + abs($x1-$x2);
}



##############Script goes below this point!#############

my @line;
my $length = rootOfNextSquare($countTo);
for (0..$length-1){
	$line[$_]=0;
}


for (0..$length-1){
	$grid[$_] = [@line];
}



my ($ypos, $xpos);
if (($length/2) =~ /^\d+\z/){
	$ypos = $length/2;
	$xpos = $length/2-1;
} else {
	$ypos = int($length/2);
	$xpos = $ypos;
}

my ($in_y,$in_x) = ($ypos, $xpos);
my $direction = ">";
$grid[$ypos][$xpos] = 1; 
for(1..$countTo){
	print "Filling Box $_\n";
	#sum my neigbors
	my $sum = 0;
		$sum += look(">",  $ypos, $xpos);
		$sum += look("dr", $ypos, $xpos);
		$sum += look("ur", $ypos, $xpos);

		$sum += look("v",  $ypos, $xpos);
		$sum += look("dl", $ypos, $xpos);

		$sum += look("<",  $ypos, $xpos);
		$sum += look("ul", $ypos, $xpos);
		$sum += look("^",  $ypos, $xpos);

	#assign current position
	$grid[$ypos][$xpos] = $sum if ($grid[$ypos][$xpos]==0);

	if ($sum > $countTo){
		print "*********$sum************";
		last;
	}
	#move direction
	($ypos, $xpos) = move $direction, $ypos, $xpos unless $_==$countTo;
	#look direction
	my $lookDir;
	$lookDir = "^" if $direction eq ">";
	$lookDir = "<" if $direction eq "^";
	$lookDir = "v" if $direction eq "<";
	$lookDir = ">" if $direction eq "v";
	
	#update direction?
	if ($_ !=$countTo and look($lookDir, $ypos, $xpos) == 0){
		$direction = $lookDir;
	}
} 

printGrid(@grid);

print "Initial (y, x): ($in_y, $in_x)\n";
print "Final (y, x):   ($ypos, $xpos)";
print "\nTaxi Distance: ";
print taxiDistance ($in_y, $in_x, $ypos, $xpos);

print "\n";
