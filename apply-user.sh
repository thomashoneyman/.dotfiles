#!/bin/sh
pushd ~/.dotfiles
home-manager switch -f ./users/trh/home.nix
popd
