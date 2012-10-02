###part of the ability find what your need is knowledge, and part of it is tools.
###tool one: perldoc -l(file location) -m (see raw source),###perlsyn is about the general syntax,perlfunc is about the built-ins
###Tool two: use strict for better coding. perl -Mstrict program.pl
### string comparison operator should not be used for comparing 

use strict;
sub testEq
{
	my $string1 = "123 ~~ 123.00";
	my $string2 = "'Mini' ~~ 'Mini'";
	print $string1,":",eval($string1);
	print "\n";
	print $string2,":",eval($string2);
}

#print "TestEq:\n";
#testEq;

## use defined to test scalar,exists test hash

sub testMode
{
	my $file = <STDIN>;
	print $file;
	print "\nmode (octal):";
	print oct($file);
}

#testMode;

sub testBitwise
{
	use Devel::Peek qw(Dump);
	my $a = '12fred34';
	print STDERR "Before conversion:\n";
	Dump($a);
	my $b = $a + 0;
	print STDERR "After conversion:\n";
	Dump($a);
	print STDERR "\n$a\n";	
}

testBitwise;