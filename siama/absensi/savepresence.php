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

    $iduser = $data->iduser;
    $idmatkul = $data->idmatkul;
    $ket = $data->keterangan;
    $tanggal = date("Y-m-d H:i:s");



//CREATE MESSAGE ARRAY AND SET EMPTY
    $apiResponse['success']=false;
    $apiResponse['code']=200;
    $apiResponse['message']="";
    $apiResponse['content']=null;

// CHECK IF RECEIVED DATA FROM THE REQUEST
if(isset($data->iduser) && isset($data->idmatkul) && isset($data->keterangan)){
    // CHECK DATA VALUE IS EMPTY OR NOT
    if(!empty($data->iduser) && !empty($data->idmatkul) && !empty($data->keterangan)){
        
        $insert_query = "INSERT INTO `absensi`(iduser,tanggal,id_matakuliah,keterangan) VALUES(:iduser,:tanggal,:idmatkul,:ket)";
        
        $insert_stmt = $conn->prepare($insert_query);
        // DATA BINDING
        $insert_stmt->bindValue(':iduser', htmlspecialchars(strip_tags($data->iduser)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':tanggal', $tanggal,PDO::PARAM_STR);
        $insert_stmt->bindValue(':idmatkul', htmlspecialchars(strip_tags($data->idmatkul)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':ket', htmlspecialchars(strip_tags($keterangan)),PDO::PARAM_STR);


        if($insert_stmt->execute()){
            $apiResponse['message'] = 'Congratulation, Presence Redorded!';
            $apiResponse['success']=true;
            $apiResponse['code']=200;  
            echo  json_encode($apiResponse);

           

        }else{
            $apiResponse['message'] = 'Presence Failed';
            $apiResponse['success']=false;
            $apiResponse['code']=100;
            echo  json_encode($apiResponse);
        } 
        
    }else{
        $apiResponse['message'] = 'Oops! empty field detected. Please fill all the field';
        $apiResponse['success']=false;
        $apiResponse['code']=100;
        echo  json_encode($apiResponse);
    }
}
else{
    $apiResponse['message'] = 'Please fill all the fields';
    $apiResponse['success']=false;
    $apiResponse['code']=100;
    echo  json_encode($apiResponse);
}
//ECHO DATA IN JSON FORMAT
?>