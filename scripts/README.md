## ask for y/n when deleting file
```bash
rm -i scripts/file-001.txt
```

## grep 
```bash
  grep ^Script file-001.txt 
  grep $fully. file-001.txt
  grep -B1 b file-001.txt #print line before match
  grep -A1 b file-001.txt #print line before match
  grep -c1 b file-001.txt #print line before & after match
  grep -i #case insenstive
```

## dictonary
```bash
cat /usr/share/dict/words
```
## man sections
```bash
The table below shows the section numbers of the manual followed by the types of pages they contain.

       1   Executable programs or shell commands
       2   System calls (functions provided by the kernel)
       3   Library calls (functions within program libraries)
       4   Special files (usually found in /dev)
       5   File formats and conventions, e.g. /etc/passwd
       6   Games
       7   Miscellaneous (including macro packages and conventions), e.g. man(7), groff(7), man-pages(7)
       8   System administration commands (usually only for root)
       9   Kernel routines [Non standard]

```
# Bash `type`, `help`, and `man` Notes

```bash
type history # show how Bash interprets a command
type -a echo # show all versions/locations of a command
help history # help for Bash builtins 
man grep # manual for external commands
compgen -b #built in bash commands
echo "$PATH" | tr : '\n' #translate : to new line
thing=$(uname -a) #set variable , by executing command in $( )
bash -n script #check for syntax error
```
