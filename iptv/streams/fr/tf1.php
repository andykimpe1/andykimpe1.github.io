<?php
$ch1 = curl_init();
curl_setopt($ch1, CURLOPT_URL, "https://mediainfo.tf1.fr/mediainfocombo/L_TF1?pver=7001001&context=MYTF1&topDomain=unknown");
curl_setopt($ch1, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch1, CURLOPT_HEADER, 0);
curl_setopt($ch1, CURLOPT_USERAGENT, "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:139.0) Gecko/20100101 Firefox/139.0");
curl_setopt($ch1,CURLOPT_SSL_VERIFYPEER, false);
$hdrs1[]="User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:139.0) Gecko/20100101 Firefox/139.0"; 
$hdrs1[]="Authorization: Bearer eyJhbGciOiJFUzI1NiIsImtpZCI6ImRlZmF1bHQiLCJ0eXAiOiJKV1QifQ.eyJhYlRlc3QiOnt9LCJleHAiOjE3NDk1MjQ0MDgsImZjZmEiOjAsImZ0Ijp7fSwiaWF0IjoxNzQ5NDgxMjA4LCJpZGQiOjAsImlzcyI6ImdpZ3lhIiwibHZsIjoxLCJtc2NiIjpmYWxzZSwibm9BdWRpZW5jZSI6ZmFsc2UsIm5vQ3VzdG9taXphdGlvbiI6ZmFsc2UsIm5vUHJvZmlsaW5nIjpmYWxzZSwicGx0Ijoid2ViIiwicHN1YiI6Ijc3YjNmYWYzLTBiMDUtNDlhZS04ZDM1LWE5ZWMyZDg1ODM2MiIsInNpZCI6IjIzNmEyNTU0LTZlOTYtNGYzMy1iNmFiLWJjODRhZTJhMzExYSIsInN1YiI6IjMxYjFhYzg3LTljMmUtNDc3My04Mjk2LWJkMTk4NzhiN2NkMyJ9.Y2wPnDnE09EFQlYC2gOR6BfHZ5JQdU7WVuWQZl6nOdqHONzy8Zy3MOSy2x8Ux9Acd8d-Tn7vjqiw_VOdLkk48A"; 
$hdrs1[]="Referer: https://prod-player.tf1.fr/";
$hdrs1[]="Origin: https://prod-player.tf1.fr";
//curl_setopt($ch1, CURLOPT_HTTPHEADER, $hdrs1);
$res1 = curl_exec($ch1);
curl_close($ch1);
$json_array = json_decode($res1, true);
$urlhls = $json_array["delivery"]["url"];
$urlpath = parse_url($urlhls, PHP_URL_PATH);
$urlquery = parse_url($urlhls, PHP_URL_QUERY);
header('Location: ' . $urlhls . '');

