function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    set aws_glyph      \uf0c2 '' # nf-mdi-cloud
    set -l PROFILE_NAME
	
    # if aws-vault is in use, override profile with that
    if test -n "$AWS_VAULT"
        set PROFILE_NAME "$aws_glyph$AWS_VAULT"
    else
        set PROFILE_NAME ""
    end

    if test -d "~/.kube"
      set ctx (kubectx -c | cut -f 2 -d '/')
      set kubens (kubectl config view --minify -o jsonpath='{..namespace}')
    else
      set ctx
      set kubens
    end
    
    printf '%s %s%s %s %s%s> ' (set_color $fish_color_quote) "$PROFILE_NAME" (set_color F73F73) "$ctx" (set_color EEC9B0) "($kubens)" (set_color $fish_color_normal) $USER \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color $fish_color_match)(fish_git_prompt)(set_color $fish_color_normal)
    # set pyenv_version (pyenv ss-3.11.3 | string split ':')
end

if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_config theme choose coolbeans
    # pyenv
    set PYENV_ROOT $HOME/.pyenv
    fish_add_path $PYENV_ROOT/bin
end

fish_vi_key_bindings
fish_user_key_bindings
bind -M insert "ç" fzf-cd-widget
# set fish_color_command 005fd7 purple

### PATH ###
set default_path /usr/bin /usr/sbin /bin /sbin $HOME/bin
set homebrew /usr/local/bin /usr/local/sbin /opt/homebrew/bin /opt/homebrew/sbin /opt/homebrew/opt/llvm/bin
set brew_rbenv "/usr/local/var/rbenv/shims"
set others_path $HOME/.cargo/bin
set conda /opt/homebrew/anaconda3/bin
set android /Users/gunner/Library/Android/sdk/platform-tools
set cosmo /opt/cosmo/bin /opt/cosmos/bin
set -gx PATH $homebrew $brew_rbenv $default_path $others_path $conda $android $cosmo

## rbenv
eval "$(rbenv init -)"

## pyenv
# set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
pyenv init - | source

## Lang
set -x LANG en_US.UTF-8

## NVM
# function nvm
#    bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
# end
# 
# set -x NVM_DIR ~/.nvm
# nvm use default --silent

alias k='kubectl'
alias vi='nvim'
alias vim='nvim'
alias cat='bat'
# alias jq='gojq'
alias ls='eza -la'
alias ll='eza -la --sort newest'
alias k='kubectl'
alias t='terraform'
alias ti='terraform init'
alias tp='terraform plan'
alias ta='terraform apply'
alias to='terraform output'
alias av='aws-vault'
alias avl='aws-vault login'
# alias git='/opt/homebrew/Cellar/git/2.43.2/bin/git'
function ave --wraps aws-vault --description 'alias av=aws-vault exec'
  set -u AWS_VAULT
  # aws-vault exec $argv
  for record in (aws-vault exec $argv -- env | grep AWS)
    set -xg (echo $record | cut -d = -f 1) (echo $record | cut -d = -f 2) 
    tmux setenv (echo $record | cut -d = -f 1) (echo $record | cut -d = -f 2) 
   end 
end
function avc --wraps aws-vault --description 'alias av=aws-vault clear'
  set -e AWS_VAULT AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SECURITY_TOKEN AWS_SESSION_TOKEN
  aws-vault clear
end
function kg
  set name (kubectl get $argv -o name)
  echo $argv[1] $name | fzf --preview 'kubectl {1} get {2} -o yaml | yq --color-output' --bind "enter:execute(kubectl {1} get {2} -o yaml | nvim -c 'set syntax=yaml' )";
end
function kgyq
  set -f FZF_DEFAULT_OPTS ''; kubectl get $argv -o yaml > /tmp/kgyq.yaml;echo '' | fzf --print-query --preview 'yq --colors {q} /tmp/kgyq.yaml';
end
alias dfimage="docker run -v /var/run/docker.sock:/var/run/docker.sock --rm alpine/dfimage"
alias swagger='docker run --rm -it  --user $(id -u):$(id -g) -e GOPATH=$(go env GOPATH):/go -v $HOME:$HOME -w $(pwd) quay.io/goswagger/swagger'

function sshc
  ssh -i ~/.ssh/lhp-com-key.pem ec2-user@$argv
end
function sshd
  ssh -i ~/.ssh/lhp-dev-key.pem ec2-user@$argv
end
function sshs
  ssh -i ~/.ssh/lhp-stg-key.pem ec2-user@$argv
end
function sshp
  ssh -i ~/.ssh/lhp-prd-key.pem ec2-user@$argv
end

set -gx JIRA_API_TOKEN (pass env/jira_api_token)
set -gx GITHUB_TOKEN (pass env/github_token)
set -gx GITLAB_TOKEN (pass env/gitlab_token)
set -gx OPENAI_API_KEY (pass env/openai_api_key)
# set -gx TF_VAR_dd_api_key
# set -gx TF_VAR_sentry_dsn
# set -gx TF_VAR_sentry_dsn_py
# set -gx TF_VAR_sentry_dsn_js
# set -gx TF_VAR_sentry_dsn_kt
# set -gx SOPS_KMS_ARN
# set -gx GITHUB_USER 9to6
# set -gx JENKINS_USER_ID teukgeonkwon
# set -gx JENKINS_API_TOKEN (pass env/jenkins_api_token)
set -gx AWS_VAULT_PASS_PREFIX aws-vault
set -gx AWS_VAULT_BACKEND pass
set -gx AWS_VAULT_PROMPT terminal
set -gx EDITOR nvim

set -gx GOROOT ~/.local/share/golang
set -gx GOPATH ~/go-projects

## FZF
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -gx FZF_ALT_C_COMMAND "fd -t d . $HOME"
set -gx FZF_ALT_C_OPTS "--preview 'tree -C {} | head -200'"
set -gx FZF_DEFAULT_COMMAND 'fd --type file --follow --hidden --exclude .git --color=always'
set -gx FZF_DEFAULT_OPTS '--preview "bat --style=numbers --color=always --line-range :500 {}" -m --height 40% --layout=reverse --border --ansi'
set -gx FZF_TMUX_OPTS '-d 40%'
#--preview "bat --style=numbers --color=always --line-range :500 {}"
set -gx BAT_STYLE header

set -g theme_display_aws yes

#bass source ~/.gvm/environments/default
set -gx PYENV_VIRTUALENV_DISABLE_PROMPT 1

# The next line updates PATH for the Google Cloud SDK.
set -gx PATH $PATH $HOME/.krew/bin

# kubectx
if test -d (brew --prefix)"/share/fish/completions"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
end

if test -d (brew --prefix)"/share/fish/vendor_completions.d"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end
kubectl completion fish | source

# JDK
fish_add_path /opt/homebrew/opt/openjdk@21/bin /opt/homebrew/sbin
set -gx JAVA_HOME /opt/homebrew/opt/openjdk@21
set -gx JDK_HOME /opt/homebrew/opt/openjdk@21
set -gx CPPFLAGS "-I/opt/homebrew/opt/openjdk@21/include" "-I/opt/homebrew/opt/llvm/include"
set -gx LDFLAGS "-L/opt/homebrew/opt/llvm/lib/c++ -Wl,-rpath,/opt/homebrew/opt/llvm/lib/c++"

set -gx JDTLS_JVM_ARGS "-javaagent:$HOME/.local/share/nvim/lsp_servers/jdtls/lombok.jar"
# set -gx JAVA_HOME /opt/homebrew/opt/openjdk@17
# set -gx JDK_HOME /opt/homebrew/opt/openjdk@17

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/homebrew/anaconda3/bin/conda
    eval /opt/homebrew/anaconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<
set -gx GLOO_SOCKET_IFNAME en0

set -gx GOPATH $HOME/go-projects; set -gx GOROOT $HOME/.local/share/golang; set -gx PATH $GOPATH/bin $PATH; # g-install: do NOT edit, see https://github.com/stefanmaric/g
set -gx XDG_CONFIG_HOME $HOME/.config
