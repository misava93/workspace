#!/usr/bin/env fish

function line-delimited-str-to-json-list

  function __print_help_msg
    echo "Usage: line-delimited-str-to-json-list <line-delimited-text>"
  end

  if not isatty stdin
    read -z -f input
  else if test (count $argv) -gt 0
    # If no piped input, use the first argument
    set input $argv[1]
    set input "$input"\n
  else
    __print_help_msg
    return 0
  end

  echo -n "$input" | jq -R -s 'split("\n")[:-1] | map(.)'
end
