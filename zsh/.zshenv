OS="`uname | tr A-Z a-z`"
ARCH="`uname -m | sed 's;i.86;x86;'`"

# base
PATH="$HOME/bin:/usr/local/bin:$PATH"
# go
GOPATH="$HOME/go"
PATH="$HOME/go/bin:$PATH"

# yarn/npm
PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# gpg
GPG_TTY=$(tty)

# export 'em
export OS ARCH PATH GPG_TTY

