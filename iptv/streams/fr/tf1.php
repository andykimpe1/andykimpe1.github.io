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
curl_setopt($ch1, CURLOPT_HTTPHEADER, $hdrs1);
$res1 = curl_exec($ch1);
curl_close($ch1);
$json_array = json_decode($res1, true);
$urlhls = $json_array["delivery"]["url"];
$urlpath = parse_url($urlhls, PHP_URL_PATH);
$urlquery = parse_url($urlhls, PHP_URL_QUERY);
$urlpath = str_replace("index.m3u8", "", $urlpath);

$urlpath = parse_url($urlhls, PHP_URL_PATH);
$urlpath = str_replace("index.m3u8", "", $urlpath);

$dest_host = "live-tf1-hls-ssai.cdn-0.diff.tf1.fr" . $urlpath . "";

$proxy_base_url = '/';

$proxied_headers = array('Set-Cookie', 'Content-Type', 'Cookie', 'Location');


$proxy_base_url_canonical = rtrim($proxy_base_url, '/ ') . '/';


if( strpos($_SERVER['REQUEST_URI'], $proxy_base_url) !== 0 )
{
    die("The config paramter \$prox_base_url \"$proxy_base_url\" that you specified 
        does not match the beginning of the request URI: ".
        $_SERVER['REQUEST_URI']);
}


$proxy_request_url = substr($_SERVER['REQUEST_URI'], strlen($proxy_base_url_canonical));

if( strpos($proxy_request_url, 'tf1.php') === 0 )
{
    $proxy_request_url = ltrim(substr($proxy_request_url, strlen('tf1.php')), '/');
}

$proxy_request_url = "https://" . rtrim($dest_host, '/ ') . '/' . $proxy_request_url;


$proxy_request_url = "" . $proxy_request_url . "?" . $$urlquery . "";

$proxy_request_url = "http://www.veesta.com/p5/index.php?q=". urlencode($proxy_request_url) . "&hl=c1";

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $proxy_request_url);
curl_setopt($ch, CURLOPT_AUTOREFERER, 1);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_HEADER, 1);
curl_setopt($ch, CURLOPT_USERAGENT, $_SERVER['HTTP_USER_AGENT']);
curl_setopt($ch,CURLOPT_SSL_VERIFYPEER, false);
curl_setopt($ch, CURLOPT_HTTPHEADER, array('Expect:'));
curl_setopt($ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_0);

/* Collect and pass client request headers */
if(isset($_SERVER['HTTP_COOKIE']))     
{ 
    $hdrs[]="Cookie: " . $_SERVER['HTTP_COOKIE'];        
}

if(isset($_SERVER['HTTP_USER_AGENT'])) 
{ 
    $hdrs[]="User-Agent: " . $_SERVER['HTTP_USER_AGENT']; 
}

curl_setopt($ch, CURLOPT_HTTPHEADER, $hdrs);

/* pass POST params */
if( sizeof($_POST) > 0 )
{ 
    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($_POST)); 
}

$res = curl_exec($ch);
curl_close($ch);
$res = str_replace("https://simulcast-p.ftven.fr/keys/hls.key", "http://www.veesta.com/p5/index.php?q=https://simulcast-p.ftven.fr/keys/hls.key&hl=c1", $res);
//https://exehukal.myhostpoint.ch/hls.key
$res = str_replace("France_2", "http://www.veesta.com/p5/index.php?q=https://" . urlencode($dest_host) . "France_2", $res);
$res = str_replace(".ts", ".ts&hl=c1", $res);

/* parse response */
list($headers, $body) = explode("\r\n\r\n", $res, 2);

$headers = explode("\r\n", $headers);
$hs = array();

foreach($headers as $header)
{
    if( false !== strpos($header, ':') )
    {
        list($h, $v) = explode(':', $header);
        $hs[$h][] = $v;
    }
    else 
    {
        $header1  = $header;
    }
}

/* set headers */
list($proto, $code, $text) = explode(' ', $header1);
header($_SERVER['SERVER_PROTOCOL'] . ' ' . $code . ' ' . $text);

foreach($proxied_headers as $hname)
{
    if( isset($hs[$hname]) )
    {
        foreach( $hs[$hname] as $v )
        {
            if( $hname === 'Set-Cookie' ) 
            {
                header($hname.": " . $v, false);
            }
            else
            {
                header($hname.": " . $v);
            }
        }
    }
}

die($body);
