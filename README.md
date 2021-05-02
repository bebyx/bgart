# bgart (Background Art)

This is a script to pull a full list of items from **wga.hu** (DB of European fine arts and architecture, started back in 1996) and download a random piece of art. That image is set as a background in GNOME then.

## Dependencies

You will obviously need Perl 5 installed. (Which is usually a default case for any Debian-based distro.)

Also, couple Perl modules are needed:

* `Archive::Zip`
* `Text::CSV_XS`

If you are not a Perl developer who uses CPAN on a regular basis, you probably want to install those modules via your GNU/Linux package manager. Like this:

```bash
sudo apt install libarchive-zip-perl libtext-csv-xs-perl
```
## Installation

Automatic distribution is being developed.

For now, you can download this repo source code and call `bgart.pl` from any folder.
