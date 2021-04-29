#!/usr/bin/env perl

use strict;
use warnings;

use Cwd 'abs_path';
use File::Basename;
use lib (dirname(__FILE__) . "/mods");;

use Text::CSV_XS;

use Unzip;
use Webroutine;

my $path = dirname(abs_path __FILE__);

my $data_zip = "data.zip";
my $data_url = "https://www.wga.hu/database/download/data_txt.zip";

my $web_agent = agent("bgart/0.1");
my $web_resource = connect($web_agent, $data_url);
download($web_resource, $data_zip, $path);

unzip($path, $data_zip);
unlink("$path/$data_zip");


my $fh;
my $raw_url;

# Count rows and take some random

open($fh, "<:encoding(iso-8859-1)", "catalog.csv") or die "catalog.csv: $!";
my $lines = 0;
while (<$fh>) {
    $lines++;
}
my $rand_line = 1 + int rand($lines);
close $fh;

# Read CSV and extract the URL of a random pic

my $csv = Text::CSV_XS->new ({ binary => 1, auto_diag => 1 });
open($fh, "<", "catalog.csv") or die "catalog.csv: $!";
while (my $row = $csv->getline ($fh)) {
  my @fields = @$row;
  if($. == $rand_line) {
    $raw_url = "$fields[6]\n";
    last;
  }
}
close $fh;

chomp $raw_url;
my $pic_url = $raw_url =~ s/^(.+)html(.+).html/$1art$2.jpg/r;
my $image_name = $pic_url =~ s/^.+\/(.+\.jpg)/$1/r;


$web_resource = connect($web_agent, $pic_url);
download($web_resource, $image_name, $path);

print "$path/$image_name\n";
my @args = ("gsettings", "set", "org.gnome.desktop.background", "picture-uri",
            "$path/$image_name");

system(@args) == 0 or die "System @args failed: $?";
