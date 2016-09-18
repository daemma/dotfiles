<!-- ####################################################################### -->
<!-- @file       Readme.md -->
<!-- @brief      Readme for dotfiles -->
<!-- @author     0xD62EE11516877AA8 -->
<!-- @date       2015-03-05 -->
<!-- @copyright  GPLv3+ -->

# Some .dotfiles -- v2.0.0
Intended as a repository for my own use, but others may find this helpful.

## Dependencies
[GNU stow](https://www.gnu.org/software/stow/stow.html)

## Install
```bash
$ ./install.sh
```

Note that `stow` will steadfastly refuse to overwright files which it 
does not "own". You will, therefore, want to remove (and back up!) your 
current relevant dotfiles. You can, of course, edit the files in 
the repository to match your own specifications.

## Modify

### GNU stow
GNU Stow is a program which allows you to create symbolic links out 
of one base directory. 
The  stow the base directory should follow a certain structure:
`~/[stow dir]/[random name]/[content]`
For example, when executing `$ stow git`, `stow` makes symblolic links from the 
content of the git folder to `~/.gitconfig`.

### Private
You may want to modify some `daemma` specifics, i.e. 
`shell/.shell.d/pii.sh`.

## License
```text
dotfiles configures a GNU/Linux user environment.
Copyright (C) 2015 0xD62EE11516877AA8

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
```

### Inspiration
This software is based on and was developed using the following packages:

 * [GNU stow template](https://github.com/Paradiesstaub/gnu_stow_template):
   The MIT License (MIT), Copyright (c) 2014 Thibaut Brandscheid
 * [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles):
   The MIT License (MIT), Copyright Mathias Bynens <http://mathiasbynens.be/>

### Contains
This contains the following GNU emacs packages/plugins:

 * [align-string](http://www.pvv.org/~markusk/align-string.el):
   GPLv3+, Copyright (c) 2001 Markus Bjartveit Krüger
 * [auto-pair](http://autopair.googlecode.com):
   GPLv3+, Copyright (C) 2009,2010 Joao Tavora
 * [cmake-mode](http://www.cmake.org/CMakeDocs/cmake-mode.el):
   BSD License, Copyright 2000-2009 Kitware, Inc., Insight Software Consortium
 * [color-theme](http://www.emacswiki.org/cgi-bin/wiki.pl?ColorTheme):
   GPLv2+, Copyright (C) 1999 Jonadab the Unsightly One, et.al.
 * [color-theme-tango](http://www.emacswiki.org/emacs/color-theme-tango.el):
   Created by danranx@gmail.com.
 * [markdown-mode](http://jblevins.org/projects/markdown-mode/):
   GPLv2+, Copyright (C) 2007-2011 Jason R. Blevins
 * [yasnippet-bundle](http://code.google.com/p/yasnippet/):
   GPLv2+, Copyright 2009 pluskid, joaotavora

<!--  end Readme.md -->
<!-- ####################################################################### -->
