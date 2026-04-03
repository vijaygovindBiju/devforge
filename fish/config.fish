# =========================
# 🔥 STARTUP (runs once)
# =========================
if status is-interactive
    clear

    set messages \
    "You opened terminal… now actually code bro 😏" \
    "Error 404: Motivation not found 😂" \
    "Works on my machine 😎" \
    "You came to code… but will customize Linux again 🤡" \
    "One more terminal ≠ productivity 😭" \
    "Bug or feature? Decide later 😌" \
    "Commit or sleep? Wrong answer always 😵" \
    "Future Flutter dev loading… 2% ⏳" \
    "You vs bug… bug winning currently 🐛" \
    "Start coding… YouTube later 😤" \
    "Today’s plan: code → break → fix → repeat 🔁" \
    "You opened terminal just to type ls 🤨" \
    "Keyboard warrior activated ⌨️🔥" \
    "Debugging: removing bugs… adding new ones 💀" \
    "Your code works… suspicious 🤔"

    printf "%s\n" $messages | shuf -n1 | cowsay -f sus | lolcat
end
#path

# Android SDK
set -x ANDROID_HOME $HOME/Android
set -x PATH $ANDROID_HOME/cmdline-tools/latest/bin $PATH
set -x PATH $ANDROID_HOME/platform-tools $PATH

# UI tools
set -x DMENU "fuzzel --dmenu"
set -x CHROME_PASSWORD_STORE basic
set -x CHROME_DESKTOP Hyprland

# Start gnome keyring
# Start gnome keyring (fish safe)
set -l keyring_output (gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)

for line in (string split ";" $keyring_output)
    if string match -q "*=*" $line
        set -l kv (string split "=" $line)
        set -gx $kv[1] $kv[2]
    end
end

# =========================
# ⚡ ALIASES (shortcuts)
# =========================
alias c="clear"
alias q="exit"
alias v="nvim"
alias code="code ."
alias update="sudo pacman -Syu"
alias install="sudo pacman -S"
alias remove="sudo pacman -Rns"

# Git shortcuts
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias gl="git pull"


# =========================
# 🧭 NAVIGATION
# =========================
alias ..="cd .."
alias ...="cd ../.."
alias home="cd ~"


# =========================
# 🧠 DEV ENV
# =========================
set -gx EDITOR nvim
set -gx TERMINAL kitty


# =========================
# 🎨 PROMPT
# =========================
function fish_prompt
    set_color green
    echo -n (whoami)"@"(prompt_hostname)" "

    set_color blue
    echo -n (prompt_pwd)

    # 🧠 reactions
    if test $status -ne 0
        # ❌ error
        set moods \
        "Bug detected 🐛" \
        "You broke it 😂" \
        "Command failed 💀" \
        "Skill issue 🤡"

        set mood (random choice $moods)
        set_color red

    else if test (count (jobs)) -gt 0
        # ⚙️ background jobs running
        set mood "Multitasking ⚙️"
        set_color magenta

    else if string match -q "*code*" (pwd)
        # 💻 coding folder
        set moods \
        "Coding mode 💻" \
        "Focus now 😤" \
        "Build something 🚀"

        set mood (random choice $moods)
        set_color cyan

    else if string match -q "*Downloads*" (pwd)
        # 📂 downloads folder
        set mood "What did you download 🤨"
        set_color yellow

    else
        # 😎 normal
        set moods \
        "Bro 😎" \
        "SUS 👀" \
        "All good ✅" \
        "Still alive 😂"

        set mood (random choice $moods)
        set_color green
    end

    echo -n " $mood "
    set_color normal
    echo -n "> "
end
