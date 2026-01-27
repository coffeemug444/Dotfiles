# cd's to yazi directory when exiting yazi
function y() {
   local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
   command yazi "$@" --cwd-file="$tmp"
   IFS= read -r -d '' cwd < "$tmp"
   [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
   rm -f -- "$tmp"
}

alias vi=$EDITOR
alias vim=$EDITOR
alias nvim=$EDITOR


mkcd () {
  \mkdir -p "$1"
  cd "$1"
}

tempe () {
  cd "$(mktemp -d)"
  chmod -R 0700 .
  if [[ $# -eq 1 ]]; then
    \mkdir -p "$1"
    cd "$1"
    chmod -R 0700 .
  fi
}

copy_template() {
   if [ $# -eq 1 ]; then
      tempe
   else
      mkcd $2
   fi

   rsync -a $1/* .
   cp ~/Templates/.clang-tidy .
   cp ~/Templates/.clang-format .
   cp ~/Templates/.gitignore .
   git init
   git add -A
   git commit -m "Initial commit"
   mkdir -p Debug
   ln -s Debug/compile_commands.json .
   $EDITOR +'CMakeGenerate' ./src/main.cpp
}

make_new() {
   copy_template ~/Templates/empty_cpp "$@"
}

make_sfml() {
   copy_template ~/Templates/empty_sfml "$@"
}

dots() {
   cd ~/.dotfiles
   $EDITOR
}

