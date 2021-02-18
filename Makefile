default: install
install:
	bash install.sh
convert:
	bash convert_from_wav.sh $(args)
