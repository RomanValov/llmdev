ENV="$(readlink -f "$(dirname "$0")")"
DIR="${DIRENV_ROOT:-$PWD}"
TAG="$(realpath --relative-base "$HOME" "$DIR")"
