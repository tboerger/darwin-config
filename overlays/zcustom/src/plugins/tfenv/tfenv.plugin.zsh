[[ -z "${TFENV_HOME}" ]] && export TFENV_HOME="${HOME}/.tfenv"

_zsh_tfenv_install() {
    echo "Installing tfenv..."
    git clone "https://github.com/tfutils/tfenv.git" "${TFENV_HOME}"
}

_zsh_tfenv_load() {
    export PATH="${TFENV_HOME}/bin:${PATH}"
}

if [[ ! -f "${TFENV_HOME}/bin/tfenv" ]]; then
    _zsh_tfenv_install
fi

if [[ -f "${TFENV_HOME}/bin/tfenv" ]]; then
    _zsh_tfenv_load
fi
