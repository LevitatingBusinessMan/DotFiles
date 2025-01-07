#!/usr/bin/fish
argparse --name=qemuargparse h/help c/cores= m/memory= g/graphic -- $argv
or exit 1

if set -q _flag_help
    echo Qemu argparse for fish
    echo \t-h, --help
    echo \t-c, --cores=n
    echo \t-m, --memory=n
    echo \t-g, --graphic
    exit
end

set -q _flag_cores
and set -g _flag_cores $_flag_cores
set -q _flag_memory
and set -g _flag_memory $_flag_memory

if set -q _flag_graphic
    set -g _flag_graphic -vga virtio
else
    set -g _flag_graphic -vga none -nographic
end
