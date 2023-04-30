#!/bin/zsh

hyperfine --warmup 3 'nvim +q'

hyperfine --warmup 3 'nvim data/sample.py +q'
