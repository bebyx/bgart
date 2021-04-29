package Webroutine;
use strict;
use warnings;
use Exporter;


our @ISA= qw( Exporter );
our @EXPORT = qw( connect download );

sub connect {
  my $user_agent = LWP::UserAgent->new;
  $user_agent->agent("bgart/0.1");

  my $req = HTTP::Request->new(GET => 'https://www.wga.hu/database/download/data_txt.zip');

  my $res = $user_agent->request($req);

  return $res;
}

sub download {
  my ($res, $file_name) = @_;
  if ($res->is_success) {
      my $page = $res->content;
      open(OUT,">","./$file_name") or die "Could not open the output file: $!";
      print OUT $page;
      close(OUT);
  }
  else {
      print $res->status_line, "\n";
  }
}
