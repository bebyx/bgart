package CSVroutine;
use strict;
use warnings;
use Exporter;
use Text::CSV_XS;

our @ISA= qw( Exporter );
our @EXPORT = qw( random_row extract_url );

sub random_row {
  my ($path, $file) = @_;
  open(my $fh, "<:encoding(iso-8859-1)", "$path/$file") or die "$file: $!";
  my $rows = 0;
  while (<$fh>) {
      $rows++;
  }
  my $rand_row = 1 + int rand($rows);
  close $fh;

  return $rand_row;
}

sub extract_url {
  my ($path, $file, $rand_row) = @_;
  my $raw_url;
  my $csv = Text::CSV_XS->new ({ binary => 1, auto_diag => 1 });
  open(my $fh, "<", "$path/$file") or die "$file: $!";
  while (my $row = $csv->getline ($fh)) {
    my @fields = @$row;
    if($. == $rand_row) {
      $raw_url = "$fields[6]\n";
      last;
    }
  }
  close $fh;

  return $raw_url;
}
