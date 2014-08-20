# Cryptor

Simple command line to create, mount and unmount encrypted containers

## Requirements
* LUKS
* cryptsetup
* losetup

Only available on linux. Tested on ubuntu, but should work in all distribution with decent version of these tools

## Features

thor list:

thor cryptor_cli:create CONTAINER KEY SIZE  # Create a new CONTAINER of SIZE and encrypt with given KEY
thor cryptor_cli:mount CONTAINER KEY        # Descrypt and mount the CONTAINER with givent KEY
thor cryptor_cli:unmount CONTAINER          # Unmount CONTAINER and cleanup

## TODO

* Include tests
* Rollback probably has some issues. Help via bug report and pull request is welcome.
* Promote it as a gem if need by users

## Notes

* This tool is a personal tool for personal usage. It comes without any warranty. Usage is under your entire responsabiity.
