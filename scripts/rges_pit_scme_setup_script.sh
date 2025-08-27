#!/bin/bash

echo "Running SMCE setup script. This will take about a minute."
if ! grep -qF '# >>> RGES-PIT setup start >>>' "${HOME}/.bashrc"; then
  mkdir -p /shared/"${USER}"/.conda
  ln -s /shared/"${USER}"/.conda "${HOME}"/.conda
  source /shared/spack/share/spack/setup-env.sh
  spack load miniforge3
  conda init > /dev/null
  conda config --set auto_activate_base false
  conda create -n default_env python=3.13 -y -q > /dev/null
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
fi
echo "SMCE setup script complete."
echo "Run \`source ~/.bashrc\` now or restart the terminal session."
