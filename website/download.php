
<?php

	function command_exist($cmd) {
		$return = shell_exec(sprintf("which %s", escapeshellarg($cmd)));
		return !empty($return);
	}

	if(isset($_POST['url'])){
		// sanitize input

		$url = $_POST['url'];

		echo "récupération de la vidéo à l'url " . $url. " ... <br>";

		if (!command_exist('youtube-dl')) {
			print '[Erreur] pas de commande youtube-dl installée sur ce serveur';
		} else {
			shell_exec('youtube-dl -i -f best --output "../input/ydl/%(title)s.%(ext)s" '.$url);
		}

	}else{
		echo "pas d'url envoyée. Vérifiez le formulaire. <a href='index.php'>Retour</a>";
	}


	include( 'website/run.php' );
