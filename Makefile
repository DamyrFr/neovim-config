clean_nvim:
	sudo apt remove -y neovim
	sudo rm -rf /usr/share/nvim /usr/lib/nvim
	rm -rf ~/.cache/nvim

install_nvim:
	wget https://github.com/neovim/neovim/releases/download/v0.9.4/nvim-linux64.tar.gz
	tar xzvf nvim-linux64.tar.gz
	sudo cp -r nvim-linux64/* /usr/
	rm -rf nvim-linux64.tar.gz nvim-linux64/

install_config:
	cp -r * ~/.config/nvim/
