#!/usr/bin/env perl

use strict;
use warnings;

use LWP;
use Cwd;

use lib "./mods";
use Unzip;
use Webroutine;

my $path = cwd();
my $data_zip = "data.zip";

my $web_resource = connect;
download($web_resource, $data_zip);

unzip($path, $data_zip);

system("rm ./$data_zip");

my $image = "source.png";

my @args = ("gsettings", "set", "org.gnome.desktop.background", "picture-uri",
            "$path/$image");

system(@args) == 0 or die "System @args failed: $?";
