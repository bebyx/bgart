#!/usr/bin/env perl

use strict;
use warnings;

use Cwd 'abs_path';
use File::Basename;
use lib (dirname(abs_path __FILE__) . "/mods");;

use Unzip;
use Webroutine;
use CSVroutine;

my $path = dirname(abs_path __FILE__);

my $data_zip = "data.zip";
my $data_url = "https://www.wga.hu/database/download/data_txt.zip";

my $web_agent = agent("bgart/0.1");
my $web_resource = connect($web_agent, $data_url);
download($web_resource, $data_zip, $path);

unzip($path, $data_zip);
unlink("$path/$data_zip");

my $csv_file = "catalog.csv";
# Count rows and take some random
my $rand_row = random_row($path, $csv_file);

# Read CSV and extract the URL of a random pic
my $raw_url = extract_url($path, $csv_file, $rand_row);

chomp $raw_url;
my $pic_url = $raw_url =~ s/^(.+)html(.+).html/$1art$2.jpg/r;
my $image_name = $pic_url =~ s/^.+\/(.+\.jpg)/$1/r;

unlink(glob("$path/*.csv"));
unlink(glob("$path/*.jpg"));
$web_resource = connect($web_agent, $pic_url);
download($web_resource, $image_name, $path);

print "$path/$image_name\n";
my @args = ("gsettings", "set", "org.gnome.desktop.background", "picture-uri",
            "$path/$image_name");

system(@args) == 0 or die "System @args failed: $?";
