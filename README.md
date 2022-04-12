# Transcription avec Vosk, par Tykayn

configuration pour transcrire des fichiers audio wav avec Vosk

## mode d'emploi

### installation
#### Prérequis
* python3 (pour l'école serpentard)
* pip3 version 19 (gestionnaire de paquets python)
* git (gestion de version)
* unzip (décompression de modèle)
* jq (pour le nettoyage de fichier json)
* ffmpeg (pour la conversion vers wav)
* youtube-dl si vous souhaitez utiliser le website
* 4Go de ram, 2Go serait trop juste pour utiliser le modèle fr par défaut.
* testé sur Ubuntu 20.04

pour les installer avec aptitude
```
sudo apt install jq python3-pip git ffmpeg
```

#### cloner ce dépot dans un dossier de travail
```bash
git clone https://forge.chapril.org/tykayn/transcription.git && cd transcription
```

* installer vosk via le MakeFile, vérifiez les prérequis ci-dessus. une fois dans votre dossier de transcription fraîchement cloné, faites la commande:
```bash
make
```
* mettre un fichier audio dans le dossier "input"
* le convertir en wav mono 
```bash
  make wav
```
* lancer la transcription du wav mono. Une démo est disponible, extraite de l'émission Libre à vous!
```bash
make convert file=input/demo.wav
```
n'oubliez pas l'argument `file=`


* la sortie texte de la transcription se trouve dans output `output/demo/4_phrases.txt` et devrait être affichée à la fin de l'exécution du script.
Chaque fichier transcrit a un sous-dossier de son nom dans le dossier output. Ainsi, pour la démo qui se trouve dans `input/demo.wav`, les fichiers de transcription sont dans `output/demo/`
 
# Précisions
* vosk est capable de fournir d'autres informations comme la seconde de début et de fin de la phrase détectée. Cela pourrait être utile pour produire des fichiers de sous titre. Cela a été ajouté dans un script perl grâce à @r_a@framapiaf.org
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
* sur Telegram
    * groupe de [discussion sur vosk](https://t.me/speech_recognition) (veille bibliographique sur la [reconnaissance automatique de la parole](https://fr.wikipedia.org/wiki/Reconnaissance_automatique_de_la_parole))
    * groupe d'[aide de vosk](https://t.me/speech_recognition_help)
* [site cipherbliss.com](https://www.cipherbliss.com/)
* [@tykayn](https://mastodon.cipherbliss.com/@tykayn) sur Mastodon.
