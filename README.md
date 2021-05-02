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

The most straightforward way is to download this repo source code and call `bgart.pl` from any folder.

You can also set everything in `/home/user/.local/` folder, intended for user environment executables and libs.

To install:

```bash
make install
```

To uninstall:

```bash
make uninstall
```

You can also use this command to quickly set `.local` folder with this command:

```bash
make setlocal
```

However, this will export path for `.local/bin` for your current shell session only.

You will also probably want to make sure the folder is included in a path export command in your `.bashrc`, `.profile`, `.zshrc` or the one for whatever shell you use in order to export every time you start a new shell session.

For instance, my `.zshrc` file has this:

```bash
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
```
