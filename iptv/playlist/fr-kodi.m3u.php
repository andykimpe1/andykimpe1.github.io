<?php
header('content-type: audio/x-mpegurl');
header('Content-Disposition: inline; filename="fr-kodi.m3u"');
$molotovsing = "signature=20251110050000_a43ad7d819c1bfe203ae38cf6bc3796eb8f1fee9&aws.sessionId=ada4de35-dca8-4fea-9e03-fb07cb1e544d";
$useragent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:144.0) Gecko/20100101 Firefox/144.0";
$date = date("Ymd");
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, "https://andykimpe1.github.io/iptv/playlist/fr-kodi-test.m3u");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_HEADER, 0);
curl_setopt($ch, CURLOPT_USERAGENT, $useragent);
curl_setopt($ch,CURLOPT_SSL_VERIFYPEER, false);
$hdrs[]="User-Agent: " . $useragent; 
curl_setopt($ch, CURLOPT_HTTPHEADER, $hdrs);
$res = curl_exec($ch);
curl_close($ch);
$res = str_replace("MOLOTOSIGN", $molotovsing, $res);
$res = str_replace("USERAGENT", $useragent, $res);
$res = str_replace("DATE", $date, $res);
echo $res;
?>
