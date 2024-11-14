if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Homebrew
eval (/opt/homebrew/bin/brew shellenv)

# SSH Agent
fish_ssh_agent

# Pyenv
status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source

# Narranomics
alias aws-assume-role-narranomics-eks-prod="aws-assume-role -a 430677622301 -r terraform --external-id=\"narranomics-terraform-D4w7jpRMEzt9@yHEDPtb\""

# Go
set -U fish_user_paths $HOME/go/bin $fish_user_paths

