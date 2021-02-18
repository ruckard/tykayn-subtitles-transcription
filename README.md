# Transcription avec Vosk, par Tykayn

configuration pour transcrire des fichiers audio wav avec Vosk

## mode d'emploi

### installation
#### Prérequis
* python3
* pip
* git

#### cloner ce dépot dans un dossier de travail
```bash
git clone https://forge.chapril.org/tykayn/transcription.git && cd transcription
```

* installer vosk via le MakeFile, nécessite python3 pip. une fois dans votre dossier de transcription fraîchement cloné, faites la commande:
```
make
```
* mettre un fichier audio dans le dossier "input"
* le convertir en wav mono (avec audacity par exemple)
* lancer la transcription du wav mono. Une démo est disponible, extraite de l'émission Libre à vous!
```
make convert file=input/demo.wav
```
n'oubliez pas l'argument `file=`


* la sortie texte de la transcription se trouve dans output `output/converted_out_without_nulls.txt` et devrait être affichée à la fin de l'exécution du script.
 
# Précisions
* vosk est capable de fournir d'autres informations comme la seconde de début et de fin de la phrase détectée. Cela pourrait être utile pour produire des fichiers de sous titre.
* les locuteurs ne sont pas détectés, toutes les phrases sont dites sans cette précision.
* si deux personnes parlent rapidement l'une après l'autre, vosk considèrera qu'il s'agit d'une seule phrase.
* les transcriptions peuvent être faites pour plusieurs langues, il faudra modifier le fichier "conversion_simple_fr.py" si on veut autre chose que du Français.

# évolutions possibles
- convertir un fichier mp3 vers WAV mono avec ffmpeg.
- nettoyer l'écho et normaliser le fichier audio.
- permettre le traitement en masse de plusieurs fichiers de podcast et leur donner un output nommé comme le fichier d'entrée afin de les distinguer.

# liens
* [podcast libre à vous](https://cause-commune.fm/podcastfilter/libre-a-vous/)
* [transcriptions libre à lire](https://www.librealire.org)
* [message parlant de transcription dans la liste de diffusion de l'april](https://listes.april.org/wws/arc/transcriptions/2021-02/msg00016.html)
* site officiel de [Vosk : installation](https://alphacephei.com/vosk/install) , [modèles de langue](https://alphacephei.com/vosk/models)
* [site cipherbliss.com](https://www.cipherbliss.com/)
* [@tykayn](https://mastodon.cipherbliss.com/@tykayn) sur Mastodon.
