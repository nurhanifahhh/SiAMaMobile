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

//CREATE MESSAGE ARRAY AND SET EMPTY
    $apiResponse['success']=false;
    $apiResponse['code']=200;
    $apiResponse['message']="";
    $apiResponse['content']=null;

// CHECK IF RECEIVED DATA FROM THE REQUEST
if(isset($data->nim) && isset($data->nama) && isset($data->kelas) && isset($data->jurusan) && isset($data->alamat) && isset($data->notelp) && isset($data->angkatan) && isset($data->password) && isset($data->email)){
    // CHECK DATA VALUE IS EMPTY OR NOT
    if(!empty($data->nim) && !empty($data->nama) && !empty($data->kelas) && !empty($data->jurusan) && !empty($data->alamat) && !empty($data->notelp) && !empty($data->angkatan) && !empty($data->password) && !empty($data->email)){
        
        $insert_query = "INSERT INTO `user_account`(nim,nama,kelas,jurusan,alamat,notelp,angkatan,password,email) VALUES(:nim,:name,:kls,:jrsn,:almt,:nmrtelp,:thnangktn,:pswd,:email)";
        
        $insert_stmt = $conn->prepare($insert_query);
        // DATA BINDING
        $insert_stmt->bindValue(':nim', htmlspecialchars(strip_tags($data->nim)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':name', htmlspecialchars(strip_tags($data->nama)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':kls', htmlspecialchars(strip_tags($data->kelas)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':jrsn', htmlspecialchars(strip_tags($data->jurusan)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':almt', htmlspecialchars(strip_tags($data->alamat)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':nmrtelp', htmlspecialchars(strip_tags($data->notelp)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':thnangktn', htmlspecialchars(strip_tags($data->angkatan)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':pswd', htmlspecialchars(strip_tags($data->password)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':email', htmlspecialchars(strip_tags($data->email)),PDO::PARAM_STR);


        if($insert_stmt->execute()){
            $apiResponse['message'] = 'Congratulation, Account Registered!';
            $apiResponse['success']=true;
            $apiResponse['code']=200;  
            echo  json_encode($apiResponse);

           

        }else{
            $apiResponse['message'] = 'Registration Failed';
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
    $apiResponse['message'] = 'Please fill all the fields | Email, Password, Status';
    $apiResponse['success']=false;
    $apiResponse['code']=100;
    echo  json_encode($apiResponse);
}
//ECHO DATA IN JSON FORMAT
?>