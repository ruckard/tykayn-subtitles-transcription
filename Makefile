default: install
install:
	bash install.sh
convert:
	bash transcript.sh $(args)
srt:
	perl clean.sh $(args) > output/clean.srt
