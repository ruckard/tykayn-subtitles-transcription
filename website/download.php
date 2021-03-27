<?php
include( '_head.php' );
?>
	<div class="container">

	  <?php
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

		  echo "<br/>récupération de la vidéo à l'url " . $url . " ... <br>";

//		if (!command_exist('youtube-dl')) {
//			print '[Erreur] pas de commande youtube-dl installée sur ce serveur';
//		} else {

		  $uniqid = date('Y-M-d_').time();

//		  # exemple url https://peertube.cipherbliss.com/videos/watch/e6a37508-042e-4d83-8598-5d36b764bb3d


//		  exec(   './youtube-dl.sh uniqueid_facho  https://peertube.cipherbliss.com/videos/watch/b88a9568-517c-4a49-ab07-75c79323a825', $output, $result );
		  exec( './youtube-dl.sh ' . $uniqid . ' ' . $url, $output, $result );

		  echo "<br/> résultat du script. <br>";
		  var_dump( $result );
		  echo "<br/> sortie du script. <br>";
		  var_dump( $output );

		  if ( $result ) {
			  echo( '<div class="alert is-danger"> problème de script </div>' );
			  include( '_foot.php' );
		  }
		  // récup du nom de fichier
		  echo "<br/>récupération de la vidéo OK. <br>";


		  echo "<br/>Conversion de la vidéo " . $uniqid . "... <br>";

		  echo "Vous pouvez télécharger vos fichiers.<br>";

		  $dir = scandir( '../input/ydl/' . $uniqid );
		  var_dump( $dir );
//		}


	  } else {
		  echo " <br> pas d'url envoyée. Vérifiez le formulaire. <a href='index.php'>Retour</a>";
	  }

//    exec(   './youtube-dl.sh canadien https://www.youtube.com/watch?v=w97pAEr3svc', $output, $result );

	  ?>

	</div>
<?php
include( '_foot.php' );
