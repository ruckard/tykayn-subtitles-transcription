<?php
	include( 'website/download.php' );
	?>
<html>
<head>
	<title>
		Transcription vosk
	</title>
</head>
<body>

<main class='container'>
	<h1>Transcription</h1>
	<section>
		Donnez l'url de la vidéo à transcrire.
		<form action='download.php' method='post' >
			<input type='text' name='url'>
			<button type='submit'>Envoyer</button>
		</form >
	</section>
	<section class='result'>
		Voici votre fichier de sous titres:

	</section>
	<section>
		<h1>Vie privée</h1>
		ce site utilise youtube-dl pour récupérer la vidéo à transcrire et travailler dessus sur le serveur où cette page est installée.
		Vous pouvez aussi installer sur votre propre machine ce logiciel libre sous licence GNU affero v3.
	</section>
</main>
</body>
</html>
