<?php
define ('SECRET_KEY','JWT_secret_key');
define ('ALGORITHM','HS512');

use \Firebase\JWT\JWT;

class SlimJWTAuth 
{

// this has changed for SLim 3 and only the function_ invoke is recognised for the add on middleware processes 

public function __invoke($request,$response, $next){
$current_user = 0;
 //Set the key      
 $AuthUser = '';
 $AuthPass = '';
 //first send to authenticate - check if authenticating
 // else check if header is 'AUTHORIZATION' then test the sent 
if($request->hasHeader('PHP_AUTH_USER') && 
  $request->hasHeader('PHP_AUTH_PW')
   ){
        //converts to a string output
$headerValueString = $request->getHeaderLine('PHP_AUTH_USER');
$AuthUser = $headerValueString;
   //converts to a string output
$headerValueString = $request->getHeaderLine('PHP_AUTH_PW');
$AuthPass = $headerValueString;
//Sets one username and password for this example
$username = 'temp';
$password = 'temporary';
 if ($AuthUser && $AuthPass && $AuthUser === $username && $AuthPass === $password ) {
// Checks if authorized then set the user number
$current_user = 1;
  if (count($current_user) != 0 ) {
 //create a new token   
$createtoken = bin2hex(openssl_random_pseudo_bytes(64));
//clean the token
$createtoken = strtr($createtoken,'+/', '-_');
          $data = [
                "iss"     => "http://your-domain.com",//change
                "jti"  => $createtoken,
                "iat"     => time(),
             //   "nbf"     => time() +10,//add ten sconds
                "exp"     => time() + (3600 * 24 * 15),
                "data" => [
                        "username" => 'temp',//set the id
                        "password"    => 'temporary',
                    ]
                ];
            $secretkey = base64_decode(SECRET_KEY);
           try
           {
               $jwt = JWT::encode($data, $secretkey,ALGORITHM);
            
           } catch (PDOException $e) {
                echo '{"error":{"text":' . $e->getMessage() . '}}';
           }
 // $UnEncoded = ['jwt' =>$jwt];
 //$SendToken = json_encode($jwt);
  $SendToken = $jwt;
 // save to text file for Demo Purposes however this should be parsed into a database .... add workings here
 file_put_contents("./token.txt",$SendToken,FILE_USE_INCLUDE_PATH);
$Newtoken = file_get_contents("./token.txt",FILE_USE_INCLUDE_PATH);
$response ->getBody()->write($Newtoken);
$response= $next($request,$response);
Return $response;
}
}
}else{  
//Incorrect Auth Details   
$response ->getBody()->write('UnAuthorized Token');
Return $response;
}
}
// function to check if Token is real
//returns boolean
public function checktoken($AuthToken){
//current user is inactive
$current_user = 0;
$decoded = '';

//check if AuthToken exists
if (isset($AuthToken)){
  //remove json
//Ltrim($AuthToken,'{"jwt":"');
//Rtrim($AuthToken,'"}');
//first set the user number
$current_user = 1;
//set the Token
  if (count($current_user) != 0 ) {
 try {
     $ToDecode = file_get_contents("./token.txt",FILE_USE_INCLUDE_PATH);
     //remove json
    // Ltrim($ToDecode,'{"jwt":"');
    // Rtrim($ToDecode,'"}');
     $secretkey =base64_decode(SECRET_KEY); 
    $decoded = JWT::decode($ToDecode, $secretkey, array(ALGORITHM));
      } catch (UnexpectedValueException $e) {
        echo $e->getMessage();
    } 
// decode to array to run extra checks
    $decoded_array = (array) $decoded; 
//add extra php checking process here

 // checks if the token matches and that the token is verified   
 if (($AuthToken ===$ToDecode) && isset($decoded)) {
 return true;
 }  
}
}
else {
return false; 
}
}
} //class 