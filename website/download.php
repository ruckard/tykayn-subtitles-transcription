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
		  $lang = isset($_POST[ 'lang' ]) ? $_POST['lang'] : 'fr';

		  echo "<br/>récupération de la vidéo à l'url " . $url . " ... <br>";

//		if (!command_exist('youtube-dl')) {
//			print '[Erreur] pas de commande youtube-dl installée sur ce serveur';
//		} else {

//		  $uniqid = date( 'Y-M-d_' ) . time();
$uniqid = 'demo_video_tk';

//		  # exemple url https://peertube.cipherbliss.com/videos/watch/e6a37508-042e-4d83-8598-5d36b764bb3d


if (file_exists('../input/ydl/'.$uniqid)) {
    echo "The file $filename exists";
}else{



//		  exec(   './youtube-dl.sh uniqueid_facho  https://peertube.cipherbliss.com/videos/watch/b88a9568-517c-4a49-ab07-75c79323a825', $output, $result );
		  exec( './youtube-dl.sh ' . $uniqid . ' ' . $url . ' ' . $lang, $output, $result );

		  $phrases_only = file_get_contents( '../input/ydl/' . $uniqid . '/3_without_nulls.txt' );

		  echo "<br/> résultat du script. <br><pre>";
		  var_dump( $result );
echo "</pre><br/> output du script. <br><pre>";
                  var_dump( $output );
echo "</pre>";


		  if ( $result ) {
			  echo '<div class="alert is-danger">  </div>
					<article class="message is-danger">
					  <div class="message-header">
					    <p>Problème de script</p>
					    <button class="delete" aria-label="delete"></button>
					  </div>
					  <div class="message-body">
					  <h2 class="title is2">
								  Sortie du script: 
						</h2><br> <br>
					    ';
			  var_dump( $output );
			  echo ' 
				  </div>
				</article>
				';
			  include( '_foot.php' );
		  }
		  // récup du nom de fichier
		  echo '<article class="message is-info">
  <div class="message-body">
    récupération de la piste audio OK.
  </div>
</article>';


		  echo "<br/>Conversion de la vidéo " . $uniqid . "... <br>";

}
		  echo '<article class="message is-success">
  <div class="message-header">
    <p>Succès</p>
    <button class="delete" aria-label="delete"></button>
  </div>
  <div class="message-body">
  Vous pouvez télécharger vos fichiers.
  <ul>
<li>
    <a href='../input/ydl/'.$uniqid.'/4_phrases_.txt'>phrases txt</a>
</li>
</ul>
  </div>
</article><br>
<article class="message is-info">
  <div class="message-header">
    <p>Texte avec uniquement les phrases</p>
    <button class="delete" aria-label="delete"></button>
  </div>
  <div class="message-body">
    ' . $phrases_only . '
  </div>
</article>
<hr>
<br>
TODO: <br>
    texte avec horodatage minute et secondes avant les phrases. <br>
    fichier de sous titres au standard srt <br>
    ';

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
