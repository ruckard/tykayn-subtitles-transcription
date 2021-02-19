default: install
install:
	bash install.sh
convert:
	bash convert_from_wav.sh $(args)
srt:
	perl clean.sh $(args) > output/clean.srt
