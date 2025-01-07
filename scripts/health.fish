#!/usr/bin/env fish
function header
    set_color -u
    #printf '===%s===\n' "$argv"
    printf '%s\n' (string upper "$argv")
    set_color normal
end

header Failed System Units
systemctl list-units --failed | rg failed | awk '{print $2}'
echo

header Storage
df -h -x vfat -x devtmpfs -x tmpfs -x efivarfs
echo
