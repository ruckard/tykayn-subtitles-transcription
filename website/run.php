<?php

exec(  './youtube-dl.sh uniqueid_facho  https://peertube.cipherbliss.com/videos/watch/b88a9568-517c-4a49-ab07-75c79323a825', $output,$result);
var_dump($output);
var_dump($result);
