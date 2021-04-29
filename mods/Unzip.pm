package Unzip;
use strict;
use warnings;
use Exporter;
use Archive::Zip qw(:ERROR_CODES);

our @ISA= qw( Exporter );
our @EXPORT = qw( unzip );

sub unzip {
  my ($path, $file) = @_;
  my $zip = Archive::Zip->new();
  my $status = $zip->read( "$path/$file");
  die "Read of $file failed\n" if $status != AZ_OK;

  $zip->extractTree();
}
