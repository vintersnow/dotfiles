#!/bin/zsh

# rm $EVAL_CACHE_DIR/init-*.sh
hyperfine --warmup 3 --shell=none 'zsh -i -c exit'

# hyperfine --warmup 3 --shell=none 'zsh -i -o NO_GLOBAL_RCS -c exit'
# hyperfine --warmup 3 --shell=none 'zsh -i -o NO_RCS -c exit'
