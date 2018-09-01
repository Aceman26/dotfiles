manipdirs() {
  if [[ $1 == example ]]; then
    printf "exp"
  else
    initial="$(echo $1 | head -c 1)"
    printf "$initial"
  fi
}

manipwd() {
  if [[ $PWD == /Users/$USER/Dev/* ]]; then
    IFS="/" read -ra DIRS <<< "$PWD"
    printf "/DEV"
    if [[ ${#DIRS[@]} -gt 4 ]]; then
      printf "/${DIRS[4]}"
      next=5
      for((i=$next;i<${#DIRS[@]}-1;i++)); do
        printf "/"
        manipdirs "${DIRS[$i]}"
      done
      # current working dir
      printf "/${DIRS[$i]}"
    elif [[ ${#DIRS[@]} -eq 4 ]]; then
      printf "/${DIRS[4]}"
    fi
  else
    printf `dirs +0`
  fi
  printf "\n"
}
