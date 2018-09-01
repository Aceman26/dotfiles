function _mcd() { md $1 ; cd $1 ; }
function _mvi() { mv $1 $2 ; vi $2 ; }
function _cvi() { cp $1 $2 ; vi $2 ; }
function _mvb() { mv $2 $1 ;}
function _crp() { realpath $1 ; realpath $1 | xclip ; }
function _gregHistory() { history | grep $1 ; }

function cat_docs() {
 cat ~/docs/${1} 
}

_catDocs () {
    # Set
    IFS=$'\n' tmp=( $(compgen -W "$(ls ~/docs/)" -- "${COMP_WORDS[$COMP_CWORD]}" ))
    COMPREPLY=( "${tmp[@]// /\ }" )
}
complete -o default -F _catDocs cat_docs

function cat_scripts() {
 cat ~/scripts/${1} 
}

_catScripts () {
    # Set
    IFS=$'\n' tmp=( $(compgen -W "$(ls ~/scripts/)" -- "${COMP_WORDS[$COMP_CWORD]}" ))
    COMPREPLY=( "${tmp[@]// /\ }" )
}
complete -o default -F _catScripts cat_scripts

_renameFileExtention () {
  old_file_name=${1}
  new_file_name="${old_file_name%.*}.${2}"
  mv $old_file_name $new_file_name
}

