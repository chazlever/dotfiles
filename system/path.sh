# Parse directories from ${FILE} and add to ${VAR}
path_helper() {
  TEMP=
  FILE="$1"
  VAR="$2"
  if [ -f "${FILE}" ]; then
    # Get a copy of VAR for various checks
    VARPATH=$(eval 'echo ${'"${VAR}"'}')

    # Get paths from file
    while read -r line
    do
      # Check if line is empty
      [ -z "$line" ] && continue

      # Add current path to temporary variable
      if [ -z "${TEMP}" ]; then
        TEMP="$(eval echo "$line")"
      else
        TEMP="${TEMP}:$(eval echo "$line")"
      fi
    done < "${FILE}"
  fi

  # Verify if paths were found and add to VAR
  if [ -n "${TEMP}" ]; then
    if [ -n "${VARPATH}" ]; then
      export "${VAR}"="${TEMP}:${VARPATH}"
    else
      export "${VAR}"="${TEMP}"
    fi
  fi
}

export PATH="$HOME/.local/bin:$PATH"

path_helper "${HOME}/.pathrc" "PATH"
path_helper "${HOME}/.pythonpathrc" "PYTHONPATH"

unset path_helper
