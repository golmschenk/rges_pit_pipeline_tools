#!/bin/bash

echo "Starting SMCE setup script."
if ! grep -qF '# >>> RGES-PIT setup start >>>' "${HOME}/.bashrc"; then
  set -x
  mkdir -p /shared/"${USER}"/.conda
  ln -s /shared/"${USER}"/.conda "${HOME}"/.conda
  source /shared/spack/share/spack/setup-env.sh
  spack load miniforge3
  conda init
  conda config --set auto_activate_base false
  conda create -n default_env python=3.13
  cat >> "${HOME}/.bashrc" << 'EOF'
# >>> RGES-PIT setup start >>>
case $- in
    *i*) ;;
      *) return;;
esac

source /shared/spack/share/spack/setup-env.sh
spack load miniforge3
conda activate default_env
# <<< RGES-PIT setup end <<<
EOF
  source "${HOME}/.bashrc"
  set +x
fi
echo "SMCE setup script complete."
