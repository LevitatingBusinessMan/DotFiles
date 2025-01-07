function fill --description 'Fill the screen with a color'
    set file (mktemp --suffix '.png')
    convert -size 1920x1080 xc:$argv[1] $file
    dunstify -t 2000 "Rotate with < and >" -i $file
    feh -F $file
end
