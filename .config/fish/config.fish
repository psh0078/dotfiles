if status is-interactive
  function fish_greeting
    neofetch
    fortune -s
  end

  # abbreviations
  function multicd
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
  end
  abbr --add dotdot --regex '^\.\.+$' --function multicd
  abbr --add -- l 'ls -alh'
  abbr --add -- v 'nvim'
end
