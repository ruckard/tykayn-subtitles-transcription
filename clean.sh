    #!/usr/bin/perl

    # Script de transformation de la sortie (json) de vosk.

    use strict; use warnings;
    use feature qw(say);

    open(F,$ARGV[0]) or die("Le script a besoin du fichier de sortie Vosk en argument.");
    undef $/;
    my $json = <F>;
    close(F);

    while ($json =~ m@(\{\s+"result" :.+?"text" :.+?\})@gs) {
        my $resultat = $1;
        # Récupération de la seconde initiale de la séquence
        my ($debut) = ($resultat) =~ m@"start" : ([^,]+),@s;
        # Récupération du texte
        my ($texte) = ($resultat) =~ m@"text" : "(.+?)"@s;

        # Transformation de la seconde en minutes-secondes
        my ($minutes,$secondes) = (0,$debut);
        $minutes = int($debut / 60);
        $secondes = int($debut % 60);
        map { $_ = "0" . $_ if $_ < 10; } ($minutes,$secondes);

        # Affichage du résultat dans le terminal.
        say join("\t","[$minutes'$secondes]",$texte);
    }
