#!/usr/bin/env perl

use strict;
use warnings;

use File::Basename;
use lib (dirname(__FILE__) . "/mods");;

use Unzip;
use Webroutine;

my $path = dirname(__FILE__);

my $data_zip = "data.zip";
my $data_url = "https://www.wga.hu/database/download/data_txt.zip";

my $web_agent = agent("bgart/0.1");
my $web_resource = connect($web_agent, $data_url);
download($web_resource, $data_zip, $path);

unzip($path, $data_zip);
unlink("$path/$data_zip");

my $image = "source.png";

my @args = ("gsettings", "set", "org.gnome.desktop.background", "picture-uri",
            "$path/$image");

system(@args) == 0 or die "System @args failed: $?";
