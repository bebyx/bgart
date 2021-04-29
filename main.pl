#!/usr/bin/env perl

use strict;
use warnings;

use Cwd;

use lib "./mods";
use Unzip;
use Webroutine;

my $path = cwd();
my $data_zip = "data.zip";
my $data_url = "https://www.wga.hu/database/download/data_txt.zip";

my $web_agent = agent("bgart/0.1");
my $web_resource = connect($web_agent, $data_url);
download($web_resource, $data_zip);

unzip($path, $data_zip);

system("rm ./$data_zip");

my $image = "source.png";

my @args = ("gsettings", "set", "org.gnome.desktop.background", "picture-uri",
            "$path/$image");

system(@args) == 0 or die "System @args failed: $?";
