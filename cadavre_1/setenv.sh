gem_binaries=$(gem environment | grep "EXECUTABLE DIRECTORY:" | sed 's,.*: \(.*\),\1,g')

printf "#Modify your PATH as following for having gem binaries in PATH\n"
printf "#\n"
printf "\texport PATH=$PATH:${gem_binaries}\n"
printf "#\n"
printf "#or eval me\n"
printf '#\teval $(./setenv.sh)'
