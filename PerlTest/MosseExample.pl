
=pod

=head1 NAME

The main goal of Moose is to make Perl 5.OO programming easiser

=head1 SYNOPSIS

package Point;
  use Moose;

  has 'x' => (isa => 'Int', is => 'rw', required => 1);
  has 'y' => (isa => 'Int', is => 'rw', required => 1);

  sub clear {
      my $self = shift;
      $self->x(0);
      $self->y(0);
  }

  package Point3D;
  use Moose;

  extends 'Point';

  has 'z' => (isa => 'Int', is => 'rw', required => 1);

  after 'clear' => sub {
      my $self = shift;
      $self->z(0);
  };

  package main;

  # hash or hashrefs are ok for the constructor
  my $point1 = Point->new(x => 5, y => 7);
  my $point2 = Point->new({x => 5, y => 7});

  my $point3d = Point3D->new(x => 5, y => 42, z => -5);

=head1 DESCRIPTION

This is the classic Point example

=head1 SEE ALSO

L<http://www.gigamonkeys.com/book/object-reorientation-generic-functions.html>

=head1 AUTHOR

Qiang Zhang

=head1 Recipe 2 BankAccount example

=cut


