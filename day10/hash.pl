#!/usr/bin/perl

#get input string from command line arguments
my $input = shift @ARGV;
print "You wrote >>>$input<<<\n";

#convert input string to list of ASCII numbers
my @chars = split //, $input;
my @ascii;
foreach (0..$#chars){
	$ascii[$_] = ord $chars[$_];
}
print $ascii[0];
print "\n";

#add suffix 17, 31, 73, 47, 23
my @suffix = (17, 31, 73, 47, 23);
push @ascii, @suffix;
print "@ascii\n";

#run 64 rounds with the same list of lengths
my $currentpos = 0;
my $skipsize = 0;

sub getSlice {
	my ($sliceSize, $curpos, @list) = @_;
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
	#Given three numbers, returns the sum of the first two modulo the third.
	my ($add1, $add2, $listsize) = @_;
	my $sum = $add1+$add2;
	return $sum % $listsize;
}

my @list;
foreach (0..255){
	$list[$_] = $_;
}

foreach(1..64){
	print "$_\n";
	foreach my $len (@ascii){
		if ($len>$#list+1){
			print "Error! Bad length $len.\n\n";
			last;
		}
		my @slice = getSlice($len, $currentpos, @list);
		@list[@slice] = reverse (@list[@slice]);
		$currentpos = circleAdd ($currentpos, $len+$skipsize, $#list+1);
		$skipsize++;
	}
}

print "@list[0..15]\n";
print "\n\n";


#use numeric bitwise XOR to combine each consecutive block of 16 numbers
#call this the dense hash
my $count = 0;
my $hex = "";
while ($count < 16){
	@els = getSlice(16, $count*16, @list);

	my $dense = 0;
	foreach (@list[@els]){
		$dense ^= $_;
	}
	print "$dense\t";
	$hex .= sprintf("%02x" , $dense);
	$count++;
}
print "\n";
print "Hex: $hex\n";
