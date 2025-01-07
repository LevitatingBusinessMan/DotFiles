function signoff --description 'alias signoff=ARCHWEB_USERNAME=Levitating ARCHWEB_PASSWORD=(pass archweb) signoff' --wraps 'signoff'
  ARCHWEB_USERNAME=Levitating ARCHWEB_PASSWORD=(pass archweb) command signoff $argv
        
end
