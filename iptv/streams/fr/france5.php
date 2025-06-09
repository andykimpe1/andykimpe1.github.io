<?php
$ch1 = curl_init();
curl_setopt($ch1, CURLOPT_URL, "http://www.veesta.com/p5/index.php?q=https://hdfauth.ftven.fr/esi/TA?url=https://simulcast-p.ftven.fr/simulcast/France_5/hls_fr5/index.m3u8&hl=c1");
curl_setopt($ch1, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch1, CURLOPT_HEADER, 0);
curl_setopt($ch1, CURLOPT_USERAGENT, "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:139.0) Gecko/20100101 Firefox/139.0");
curl_setopt($ch1,CURLOPT_SSL_VERIFYPEER, false);
$res1 = curl_exec($ch1);
curl_close($ch1);
$urlpath = parse_url($res1, PHP_URL_PATH);
$urlpath = str_replace("index.m3u8", "", $urlpath);

$dest_host = "simulcast-p.ftven.fr/" . $urlpath . "";

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

if( strpos($proxy_request_url, 'france5.php') === 0 )
{
    $proxy_request_url = ltrim(substr($proxy_request_url, strlen('france5.php')), '/');
}

$proxy_request_url = "https://" . rtrim($dest_host, '/ ') . '/' . $proxy_request_url;

$proxy_request_url = "http://www.veesta.com/p5/index.php?q=". urlencode($proxy_request_url) . "&hl=c1";

/* Init CURL */
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
$res = str_replace("https://simulcast-p.ftven.fr/keys/hls.key", "https://exehukal.myhostpoint.ch/hls.key", $res);
$res = str_replace("France_2", "http://www.veesta.com/p5/index.php?q=https%3A%2F%2Fsimulcast-p.ftven.fr%2FZXhwPTE3NDg3NDQyOTF%2BYWNsPSUyZip%2BaG1hYz1iOTFjZGFkYTU3MmI0Y2Q0ZGExY2U0MjkyNmRhZTllOGQ2YWUwZjUyNjdlNWVhMzZjYTljYmNlMzQ0OTg1Mzk0%2Fsimulcast%2FFrance_2%2Fhls_fr2%2FFrance_2", $res);
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
