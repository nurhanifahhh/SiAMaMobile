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
if(isset($data->id_matakuliah) && isset($data->nama_matakuliah) && isset($data->id_jadwalkuliah) && isset($data->hari) && isset($data->tanggal) && isset($data->waktu) && isset($data->dosen_pengajar)){
    // CHECK DATA VALUE IS EMPTY OR NOT
    if(!empty($data->id_matakuliah) && !empty($data->nama_matakuliah) && !empty($data->id_jadwalkuliah) && !empty($data->hari) && !empty($data->tanggal) && !empty($data->waktu) && !empty($data->dosen_pengajar)){
        
        $insert_query = "INSERT INTO `jadwal_kuliah`(id_matakuliah,nama_matakuliah,id_jadwalkuliah,hari,tanggal,waktu,dosen_pengajar) VALUES(:id_matakuliah,:nama_matakuliah,:id_jadwalkuliah,:hari,:tanggal,:waktu,:dosen_pengajar)";
        
        $insert_stmt = $conn->prepare($insert_query);
        // DATA BINDING
        $insert_stmt->bindValue(':id_matakuliah', htmlspecialchars(strip_tags($data->id_matakuliah)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':nama_matakuliah', htmlspecialchars(strip_tags($data->nama_matakuliah)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':id_jadwalkuliah', htmlspecialchars(strip_tags($data->id_jadwalkuliah)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':hari', htmlspecialchars(strip_tags($data->hari)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':tanggal', htmlspecialchars(strip_tags($data->tanggal)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':waktu', htmlspecialchars(strip_tags($data->waktu)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':dosen_pengajar', htmlspecialchars(strip_tags($data->dosen_pengajar)),PDO::PARAM_STR);


        if($insert_stmt->execute()){
            $apiResponse['message'] = 'Congratulation, Course Registered!';
            $apiResponse['success']=true;
            $apiResponse['code']=200;  
            echo  json_encode($apiResponse);

           

        }else{
            $apiResponse['message'] = 'Registration Course Failed';
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