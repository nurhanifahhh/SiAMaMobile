<?php
// SET HEADER
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// INCLUDING DATABASE AND MAKING OBJECT
require '../database.php';
$db_connection = new Database();
$conn = $db_connection->dbConnection();

// GET DATA FORM REQUEST
$data = json_decode(file_get_contents("php://input"));

//CHECKING, IF ID AVAILABLE ON $data
if(isset($data->latitude) && isset($data->longtitude)){
    
    $apiResponse['success']=false;
    $apiResponse['code']=200;
    $apiResponse['message'] = '';
    $apiResponse['content'] = null;
    $lat2 = $data->latitude;
    $lon2 = $data->longtitude;
    $lat1 = 1.118673; //latitude politeknik
    $lon1 = 104.048442; //longtitude politeknik

    function computeDistance($lat1, $lon1, $lat2, $lon2, $radius = 6378137){
        static $x = M_PI / 180;
        $lat1 *= $x; $lon1 *= $x;
        $lat2 *= $x; $lon2 *= $x;
        $distance = 2 * asin(sqrt(pow(sin(($lat1 - $lat2) / 2), 2) + cos($lat1) * cos($lat2) * pow(sin(($lon1 - $lon2) / 2), 2)));
        $jarak = $distance * $radius;
        return $jarak;
        }

        echo $jarak = computeDistance($lat1, $lon1, $lat2, $lon2);

        if($jarak <= 500){
            $apiResponse['message'] = 'OK';
            $apiResponse['success']=true;
            $apiResponse['code']=200;  
        }else{
            $apiResponse['message'] = 'Error';
            $apiResponse['success']=false;
            $apiResponse['code']=100;
        }
    }else{
            $apiResponse['message'] = 'No Latitude or Longtitude Detected';
            $apiResponse['success']=false;
            $apiResponse['code']=100;
    }
    echo json_encode($apiResponse);
?>