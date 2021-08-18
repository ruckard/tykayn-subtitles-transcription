<?php
include( '_head.php' );
?>
<section class="hero is-info is-large">
	<div class="hero-body">
		<div class="container">

			<p class="title">
				Conversion d'audio ou de vidéo en texte
			</p>
			<p class="subtitle">
				Transcrire en Français avec une URL
			<form action='download.php' method='post'>
				<input class="input is-block" type='text' name='url'
				       value="https://peertube.cipherbliss.com/videos/watch/e6a37508-042e-4d83-8598-5d36b764bb3d">
				<br>
				<button class="button is-primary" type='submit'>Envoyer</button>
			</form>
		</div>
		</p>
	</div>
</section>


<?php
include( '_foot.php' );
?>
