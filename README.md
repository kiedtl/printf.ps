# printf.ps
'printf' function for PowerShell

### Usage:
#### printf
This is a very simple printf implementation. dot-source the file into your scripts and then call it:
```powershell
. "$psscriptroot/lib/printf.ps1"
printf "my {0} is {1}" 'name' 'steve'
```
#### cprintf
This is a more fully-features version of printf, allowing you to print bold, underlined, or multicolored text.
```powershell
# print bold green and without a newline
printf -nb -c '0,255,0' 'there are {0} {1}' '16','employees'
```
