source ~/py3/bin/activate



# aliases
alias gopersonal="cd ~/git/personal"
alias gobel="cd ~/git/personal/belastingen-app"
alias godot="cd ~/git/personal/my-dot-files"
alias gogit="cd ~/git"
alias gowork="cd ~/git/work"

# tmux
alias tmuxme="tmux new -s coding"
alias tmuxme="tmux new -s vms"

if [[ `tmux list-sessions` != *"coding"* ]]; then
  tmux new-session -d -s s_coding -n w_coding

# split coding window in 3 panes 
  tmux select-window -t 's_coding:w_coding'
  tmux split-window -d -t 's_coding:w_coding' -v
  tmux split-window -d -t '{bottom}' -h
  tmux send-keys -t '{top}' clear Enter
  tmux send-keys -t '{bottom-left}' clear Enter
  tmux send-keys -t '{bottom-right}' clear Enter

  tmux new-window -d -a -n w_background

# split backgound window int 2 panes
  tmux select-window -t 's_coding:w_background'
  tmux split-window -d -t 's_coding:w_background' -v

  tmux select-window -t 's_coding:w_coding'

fi
tmux attach-session -t s_coding
clear
