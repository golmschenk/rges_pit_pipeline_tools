if ! grep -qF '# >>> Greg Olmschenk setup start >>>' "${HOME}/.bashrc"; then
  source /shared/spack/share/spack/setup-env.sh
  spack load miniforge3
  conda init
  conda config --set auto_activate_base false
  cat >> "${HOME}/.bashrc" << 'EOF'
# >>> Greg Olmschenk setup start >>>
case $- in
    *i*) ;;
      *) return;;
esac

source /shared/spack/share/spack/setup-env.sh
spack load miniforge3
conda activate default_env
# <<< Greg Olmschenk setup end <<<
EOF
fi
