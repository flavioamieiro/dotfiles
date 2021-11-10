Antes de começar, é bom instalar alguns pacotes necessários. No debian são:

```
sudo apt-get install git tmux rxvt-unicode i3 i3status screen gvim emacs caffeine rofi fonts-3270
```

Depois é só criar os links simbólicos

```
./create_symlinks.sh
```

Os links das regras de udev não são criados automaticamente porque precisam de
permissão de root, mas você pode criar quando necessário.
