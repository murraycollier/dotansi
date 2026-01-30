#!/usr/bin/env bash

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz &&
sudo rm -rf /opt/nvim-linux-x86_64 &&
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz &&
curl -sS https://starship.rs/install.sh | sh
echo 'eval "$(starship init bash)"' >>~/.bashrc &&
echo 'export PATH=/opt/nvim-linux-x86_64/bin/:$PATH' >>~/.bashrc &&
cat <<'EOF' > ~/.config/starship.toml
add_newline = true
command_timeout = 2000

format = """$env_var$os$username$hostname$directory$git_branch$git_status$python
$character
"""

[character]
success_symbol = "╰⎯"
error_symbol = "╰⎯"
# ╭╴ ╰─

[env_var]
symbol = "╭╴"
variable = 'SHELL'
format = "$symbol"
disabled = false


#warp-Drop ugly default prompt characters
#success_symbol = ""
#error_symbol = ""

# ---

[os]
format = '[$symbol](bold white) '
disabled = false

[os.symbols]
Windows = ' '
Arch = '󰣇'
Ubuntu = ''
Macos = '󰀵'
Unknown = '󰠥'

# ---y

# Shows the username
[username]
style_user = 'yellow bold'
style_root = 'black bold'
format = '[//](black bold) [$user](#2883ff) '
disabled = false
show_always = true

# Shows the hostname
[hostname]
ssh_only = false
format = '[//](black bold) [$hostname](bold blue) '
disabled = false

# Shows current directory
[directory]
truncation_symbol = '…/'
home_symbol = '~'
read_only = '  '
format = '[//](black bold) [$path]($style)[$read_only]($read_only_style) '
style = '#7ed1fb'

# Shows current git branch
[git_branch]
symbol = ''
format = '[//](black bold) [$symbol\[$branch\]]($style) '
style = 'bold green'

# Shows current git status
[git_status]
disabled = false
format = '[ $all_status $ahead_behind]($style) '
style = 'bold green'
conflicted = '🏳'
up_to_date = ''
untracked = '${count} '
ahead = '⇡${count}'
diverged = '⇕⇡${ahead_count}⇣${behind_count}'
behind = '⇣${count}'
stashed = ' '
modified = ' '
staged = '[++(${count})](green)'
renamed = '襁 '
deleted = ' '

# Shows kubernetes context and namespace
[kubernetes]
format = 'via [󱃾 $context($namespace)](bold purple) '
disabled = false

# ---

[vagrant]
disabled = true

[docker_context]
disabled = true

[helm]
disabled = true

[python]
symbol = '󰌠'
python_binary = ['./venv/bin/python', 'python', 'python3', 'python2']
format = '[//](black bold) [${symbol} ${pyenv_prefix}(${version} )(($virtualenv) )]($style) '

[nodejs]
disabled = true

[ruby]
disabled = true

[terraform]
disabled = true
EOF

