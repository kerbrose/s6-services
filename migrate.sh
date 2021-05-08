#!/bin/bash

init=s6

for d in $(find . -type d -name "*-$init");do
    pkg=${d#*/}
#     rm -rv $pkg/x86_64
#     rm -v $pkg/{Jenkinsfile,.gitrepo,.gitignore,README.md}
#     rm -v $pkg/trunk/*.install
#     mv -v $pkg/trunk/* $pkg
#     rm -vr $pkg/trunk
#     rm -vr $pkg/.artixlinux
    name=${pkg%-*}
    mv -v $pkg $name
done
