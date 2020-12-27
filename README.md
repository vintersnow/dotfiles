# dotfiles
my dotfiles

#install

Install local
```
git clone git@github.com:vintersnow/dotfiles.git ~/.dotfiles
cd ~/.dotfiles/ansible
ansible-playbook setup.yaml -i hosts_local -c local
```

Install from remote

```
cd ~/.dotfiles/ansible
ansible-playbook setup.yaml -i hosts -K
```
