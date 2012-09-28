##µü´úËã·¨
sub binary
{
	my ($input) = @_;
	return $input if $input == 0 or $input == 1;
	my $k = int($input/2);
	my $b = $input % 2;
	return binary($k).$b;
}

sub factorial 
{
	my ($input) = @_;
	return 1 if $input ==1 or $input==0;
	return factorial($input-1)*$input;
}

##The tower of hanoi
sub hanoi
{
	my ($n,$start,$end,$extra,$move_disk) = @_;
	if ($n == 1)
	{
		$move_disk->(1,$start,$end);
	}
	else
	{
		hanoi($n-1,$start,$extra,$end,$move_disk);
		$move_disk->($n,$start,$end);
		hanoi($n-1,$extra,$end,$start,$move_disk);
	}
}

sub print_instruction
{
	my ($disk,$start,$end) = @_;
	print "Move disk #$disk from $start to $end\n";
}

my @position = ('',('A') x 3);
sub check_move
{
	my $i;
	my ($disk,$start,$end) = @_;
	if($disk <1 or $disk >$#position)
	{
		die "wrong disk number $disk";
	}
	if ($position[$disk] ne $start)
	{
		die "Disk $disk is on start platform $start\n";
	}
	for $i (1..$disk-1)
	{
		if($position[$i] eq $start)
		{
			die "$i is on top of disk $disk, can not move\n";
		}
		elsif($position[$i] eq $end)
		{
			die "$i is on the target platform, disk $disk can not move\n";
		}
	}
	print "Moving disk $disk from $start to $end\n";
	$position[$disk] = $end;
}

#hanoi(3,"A","B","C",\&print_instruction);
#hanoi(3,"A","B","C",\&check_move);

#compute the total size of directory
sub total_size
{
	my ($top) = @_;
	my $total = -s $top;
	print "$total\n";
	return $total if -f $top;
	my $DIR;	
	unless (opendir($DIR,$top))
	{
		warn "can not oepn directory $top\n";
		return $total;
	}
	my $file;
	while ($file = readdir $DIR)
	{
		next if $file eq '.'||$file eq '..';
		$total += &total_size("$top/$file");
	}
	close $DIR;
	return $total;
}

#print total_size('C:\Users\qzhang\Downloads\coursera-download-v0.5');


