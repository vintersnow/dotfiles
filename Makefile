DOTPATH    := $(PWD)
TARGET := $(wildcard .??*)
EXCLUSIONS := .DS_Store .git .gitmodules .gitignore
DOTFILES   := $(filter-out $(EXCLUSIONS), $(TARGET))


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

install: update deploy init
	@exec $$SHELL

clean:
	@echo "==> Remove dotfiles from your home directory."
	@-$(foreach val, $(DOTFILES), rm -vrf $(HOME)/$(val);)

