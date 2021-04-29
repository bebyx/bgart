package Webroutine;
use strict;
use warnings;
use Exporter;
use LWP;


our @ISA= qw( Exporter );
our @EXPORT = qw( agent connect download );

sub agent {
  my ($agent_name) = @_;
  my $user_agent = LWP::UserAgent->new;
  $user_agent->agent("$agent_name");
  return $user_agent;
}

sub connect {
  my ($user_agent, $target_url) = @_;

  my $request = HTTP::Request->new(GET => "$target_url");

  my $resource = $user_agent->request($request);

  return $resource;
}

sub download {
  my ($resource, $file_name) = @_;
  if ($resource->is_success) {
      my $page = $resource->content;
      open(OUT,">","./$file_name") or die "Could not open the output file: $!";
      print OUT $page;
      close(OUT);
  }
  else {
      print $resource->status_line, "\n";
  }
}
