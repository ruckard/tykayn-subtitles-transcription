<?php
include( '_head.php' );
/**
 * récupération d'une vidéo par youtube dl et conversion
 */


/**
 * @param $cmd
 *
 * @return bool
 */
function command_exist( $cmd ) {
	$return = shell_exec( sprintf( "which %s", escapeshellarg( $cmd ) ) );

	return ! empty( $return );
}

if ( isset( $_POST[ 'url' ] ) ) {
	// sanitize input

	$url = $_POST[ 'url' ];

	echo "récupération de la vidéo à l'url " . $url . " ... <br>";

//		if (!command_exist('youtube-dl')) {
//			print '[Erreur] pas de commande youtube-dl installée sur ce serveur';
//		} else {

	$uniqid = time();

	# exemple url https://peertube.cipherbliss.com/videos/watch/e6a37508-042e-4d83-8598-5d36b764bb3d
	shell_exec( 'bash youtube-dl.sh ' . $uniqid . ' ' . $url );

//			shell_exec('youtube-dl --extract-audio --audio-format flac --audio-quality 0 --output "../input/ydl/$time.flac" '.$url);
//			shell_exec('youtube-dl --extract-audio --audio-format flac --audio-quality 0 --output "../input/ydl/%(title)s_audio.%(ext)s" '.$url);
	// récup du nom de fichier
	echo "récupération de la vidéo OK " . $url . ". <br>";


	echo "Conversion de la vidéo" . $url . "... <br>";

	echo "Vous pouvez télécharger vos fichiers.<br>";

	$dir = scandir( '../input/ydl' );
	var_dump( $dir );
//		}


} else {
	echo "pas d'url envoyée. Vérifiez le formulaire. <a href='index.php'>Retour</a>";
}


include( '_foot.php' );
