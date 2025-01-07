function openai-cli --wraps='OPENAI_API_KEY=(cat ~/chatgptkey) /usr/bin/openai-cli' --description 'alias openai-cli=OPENAI_API_KEY=(cat ~/chatgptkey) /usr/bin/openai-cli'
  OPENAI_API_KEY=(cat ~/.chatgptkey) command openai-cli $argv
        
end
