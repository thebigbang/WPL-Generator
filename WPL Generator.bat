goto EndComment
This file is part of WPL Generator.
WPL Generator is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
any later version.
WPL Generator is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with Foobar. If not, see <http://www.gnu.org/licenses/>.
Copyright (c) Meï-Garino Jérémy
:EndComment
@echo off
Setlocal EnableDelayedExpansion
set /p PlayListName=Nom de votre playlist:
set "output=%PlayListName%.wpl"
set "ext=.png"
set cnt=0
for %%A in (*%ext%) do set /a cnt+=1
set "head=<?wpl version="1.0"?><smil><head><meta name="Generator" content="Jérémy Meï-Garino WPL Generator Tool"/><meta name="ItemCount" content="%cnt%"/><title>%PlayListName%</title></head><body><seq>"
set "tail=</seq></body></smil>"
@echo génération de la liste des fichiers...
echo !head!> %output%
for %%f in (*%ext%) do (
	set "s=<media src="%%~nf.png"/>"
	echo !s!>>%output%
	@echo|set /p=.
)
echo !tail!>> %output%
@echo on
%output%