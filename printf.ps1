#!/usr/bin/env pwsh

function printf {
    try {
        $ftext = $args[0] -f $args[1..($args.Count)]
    } catch {
        $ftext = $args[0]
    }
    write-output $ftext
}

function cprintf {
    param (
        [string]$text,
        [array]$formatlist,
        [alias('c')]
        [string]$color = "255,255,255",
        [alias('b')]
        [switch]$bold,
        [alias('n')]
        [switch]$nonewline
    )
    try {
        $ftext = $text -f $formatlist
    } catch {
        $ftext = $text
    }
    $e = [char]0x1B
    $r = $color.Split(',')[0]
    $g = $color.Split(',')[1]
    $b = $color.Split(',')[2]
    $extra = ""
    if ($bold) {
        $extra += "$e[1m"
    }
    if ($nonewline) {
        write-host "${extra}$e[38;2;$r;$g;${b}m${ftext}$e[0m" -nonewline
    } else {
        write-output "${extra}$e[38;2;$r;$g;${b}m${ftext}$e[0m"
    }
}
