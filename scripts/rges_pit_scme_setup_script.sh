if ! grep -qF '# >>> Greg Olmschenk setup start >>>' "${HOME}/.bashrc"; then
  ln -s /shared/$USER/.conda ~/.conda
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
fi
