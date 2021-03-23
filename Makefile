default: install
install:
	bash install.sh
wav:
	bash inputs_to_wav.sh
convert:
	bash transcript.sh $(args)
srt:
	perl clean.sh $(args) > output/clean.srt
