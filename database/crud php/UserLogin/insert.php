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
$msg['message'] = '';

// CHECK IF RECEIVED DATA FROM THE REQUEST
if(isset($data->nim) && isset($data->password) && isset($data->nama_mahasiswa) && isset($data->kelas) && isset($data->jurusan) && isset($data->alamat) && isset($data->nomor_telp) && isset($data->tahun_angkatan) && isset($data->email)){
    // CHECK DATA VALUE IS EMPTY OR NOT
    if(!empty($data->nim) && !empty($data->password) && !empty($data->nama_mahasiswa) && !empty($data->kelas) && !empty($data->jurusan) && !empty($data->alamat) && !empty($data->nomor_telp) && !empty($data->tahun_angkatan) && !empty($data->email)){
        
        $insert_query = "INSERT INTO `user_account`(nim,password,nama_mahasiswa,kelas,jurusan,alamat,nomor_telp,tahun_angkatan,email) VALUES(:nim,:password,:nama_mahasiswa,:kelas,:jurusan,:alamat,:nomor_telp,:tahun_angkatan,:email)";
        
        $insert_stmt = $conn->prepare($insert_query);
        // DATA BINDING
        $insert_stmt->bindValue(':nim', htmlspecialchars(strip_tags($data->nim)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':password', htmlspecialchars(strip_tags($data->password)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':nama_mahasiswa', htmlspecialchars(strip_tags($data->nama_mahasiswa)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':kelas', htmlspecialchars(strip_tags($data->kelas)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':jurusan', htmlspecialchars(strip_tags($data->jurusan)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':alamat', htmlspecialchars(strip_tags($data->alamat)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':nomor_telp', htmlspecialchars(strip_tags($data->nomor_telp)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':tahun_angkatan', htmlspecialchars(strip_tags($data->tahun_angkatan)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':email', htmlspecialchars(strip_tags($data->email)),PDO::PARAM_STR);
        
        if($insert_stmt->execute()){
            $msg['message'] = 'Data Inserted Successfully';
        }else{
            $msg['message'] = 'Data not Inserted';
        } 
        
    }else{
        $msg['message'] = 'Oops! empty field detected. Please fill all the fields';
    }
}
else{
    $msg['message'] = 'Please fill all the fields';
}
//ECHO DATA IN JSON FORMAT
echo  json_encode($msg);
?>