#!/bin/bash
export LC_ALL=C
#
function -h {
  cat <<USAGE
   USAGE: Generates Traefik config
   -b / --backend confd backend (configuration source)
   -d / --debug   debugging output
USAGE
}; function --help { -h ;}

function msg { out "$*" >&1 ;}
function out { printf '%s\n' "$*" ;}
function err { local x=$? ; msg "$*" ; return $(( $x == 0 ? 1 : $x )) ;}

function main {
  local debug=false
  # confd backend (default: ENV variables)
  local backend="env"
  while [[ $# -gt 0 ]]
  do
    case "$1" in                                      # Munging globals, beware
      -b|--backend)       backend=true; shift 1 ;;
      -d|--debug)         debug=true; shift 1 ;;
      *)                    err 'Argument error. Please see help: -h' ;;
    esac
  done
  if [[ $debug == true ]]; then
    set -ex
  fi
  if [ -f traefik_linux-amd64 ]; then
    chmod +x traefik_linux-amd64
  fi
  confd=$(ls -1 confd-*)
  if [ -f "${confd}" ]; then
    chmod +x ${confd}
  fi
  mkdir -p $(pwd)/{conf.d,templates}
  msg "Generating Traefik configuration"
  ./${confd} -onetime -backend ${backend} --confdir $(pwd)
}

if [[ ${1:-} ]] && declare -F | cut -d' ' -f3 | fgrep -qx -- "${1:-}"
then
  case "$1" in
    -h|--help) : ;;
    *) ;;
  esac
  "$@"
else
  main "$@"
fi
