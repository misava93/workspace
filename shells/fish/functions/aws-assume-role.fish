function aws-assume-role
  
  function __print_help_msg
    echo "Usage: aws-assume-role -a/--account-id <value> -r/--role-name <value> [-e/--external-id <value>]"
  end
  
  set -l options (fish_opt -s h -l help)
  set options $options (fish_opt -s a -l account-id -r)
  set options $options (fish_opt -s r -l role-name -r)
  set options $options (fish_opt -s e -l external-id -o) 
  
  if test  (count  $argv) -lt  2
    __print_help_msg
    return 0
  end

  argparse -n aws-assume-role $options -- $argv
  or return

  if set -q _flag_help
     __print_help_msg
     return 0
  end

  set -l assume_role_options "--role-arn \"arn:aws:iam::$_flag_account_id:role/$_flag_role_name\" --role-session-name $_flag_role_name"
  
  if test -n "$_flag_external_id"
    set assume_role_options "$assume_role_options --external-id $_flag_external_id"
  end

  set -l aws_output (eval aws sts assume-role $assume_role_options)
  set -g -x AWS_ACCESS_KEY_ID (echo $aws_output | jq -r '.Credentials.AccessKeyId')
  set -g -x AWS_SECRET_ACCESS_KEY (echo $aws_output | jq -r '.Credentials.SecretAccessKey')
  set -g -x AWS_SESSION_TOKEN (echo $aws_output | jq -r '.Credentials.SessionToken')
  echo "KEY ID = $AWS_ACCESS_KEY_ID"
  echo "SECRET KEY = $AWS_SECRET_ACCESS_KEY"
  echo "SESSION TOKEN = $AWS_SESSION_TOKEN"
end
