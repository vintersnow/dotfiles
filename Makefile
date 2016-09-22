DOTPATH    := $(PWD)
TARGET := $(wildcard .??*)
EXCLUSIONS := .DS_Store .git .gitmodules .gitignore
DOTFILES   := $(filter-out $(EXCLUSIONS), $(TARGET))
ZSHFILES	 := .zsh.d .zshrc .zshenv

all:install

list:
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)

deploy:
	@echo '==> Copy dotfiles to home directory.'
	@echo ''
	@$(foreach val,$(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

init:
	@echo "==> Initialized for this os."
	@DOTPATH=$(DOTPATH) bash $(DOTPATH)/etc/init/init.sh

update:
	git pull origin master
	git submodule init
	git submodule update
	git submodule foreach git pull origin master

install: update init deploy 
	@exec $$SHELL

zsh:
	@echo '==> Copy zsh setting files to home directory.'
	@$(foreach val,$(ZSHFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

clean:
	@echo "==> Remove dotfiles from your home directory."
	@-$(foreach val, $(DOTFILES), rm -vrf $(HOME)/$(val);)

