#!/usr/bin/env bash

trash /etc/zsh*
cp -rv zsh* /etc/
chown root:root /etc/zsh*  
