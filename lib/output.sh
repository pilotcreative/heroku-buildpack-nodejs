timestamp() {
  date --iso-8601=seconds
}

info() {
  echo "$(timestamp)         $*" || true
}

# format output and send a copy to the log
output() {
  local logfile="$1"

  while read LINE;
  do
    echo "$(timestamp)         $LINE" || true
    echo "$(timestamp)  $LINE" >> "$logfile" || true
  done
}

header() {
  echo "$(timestamp)" || true
  echo "$(timestamp)  -----> $*" || true
}

error() {
  echo " !     $*" >&2 || true
  echo "" || true
}
