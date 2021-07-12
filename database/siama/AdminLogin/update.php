<?php
// SET HEADER
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: PUT");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// INCLUDING DATABASE AND MAKING OBJECT
require '../database.php';
$db_connection = new Database();
$conn = $db_connection->dbConnection();

// GET DATA FORM REQUEST
$data = json_decode(file_get_contents("php://input"));

//CHECKING, IF ID AVAILABLE ON $data
if(isset($data->id)){
    
    $apiResponse['success']=false;
    $apiResponse['code']=200;
    $apiResponse['messages']="";
    $apiResponse['content']=null;
    $post_id = $data->id;
    
    //GET POST BY ID FROM DATABASE
    $get_post = "SELECT * FROM `user_account` WHERE id=:post_id";
    $get_stmt = $conn->prepare($get_post);
    $get_stmt->bindValue(':post_id', $post_id,PDO::PARAM_INT);
    $get_stmt->execute();
    
    
    //CHECK WHETHER THERE IS ANY POST IN OUR DATABASE
    if($get_stmt->rowCount() > 0){
        
        // FETCH POST FROM DATBASE 
        $row = $get_stmt->fetch(PDO::FETCH_ASSOC);
        
        // CHECK, IF NEW UPDATE REQUEST DATA IS AVAILABLE THEN SET IT OTHERWISE SET OLD DATA
        $post_nim = isset($data->nim) ? $data->nim : $row['nim'];
        $post_email = isset($data->email) ? $data->email : $row['email'];
        $post_password = isset($data->password) ? $data->password : $row['password'];
        $post_nama = isset($data->nama) ? $data->nama : $row['nama'];
        $post_kelas = isset($data->kelas) ? $data->kelas : $row['kelas'];
        $post_jurusan = isset($data->jurusan) ? $data->jurusan : $row['jurusan'];
        $post_alamat = isset($data->alamat) ? $data->alamat : $row['alamat'];
        $post_notelp = isset($data->notelp) ? $data->notelp : $row['notelp'];
        $post_angkatan = isset($data->angkatan) ? $data->angkatan : $row['angkatan'];
        
        $update_query = "UPDATE `user_account` SET nim = :nim, nama = :nama, kelas = :kelas, jurusan = :jurusan, alamat = :alamat, notelp = :notelp, angkatan = :angkatan, password = :password, email = :email WHERE id = :id";
        
        $update_stmt = $conn->prepare($update_query);
        
        // DATA BINDING AND REMOVE SPECIAL CHARS AND REMOVE TAGS
        $update_stmt->bindValue(':nim', htmlspecialchars(strip_tags($post_nim)),PDO::PARAM_STR);
        $update_stmt->bindValue(':nama', htmlspecialchars(strip_tags($post_nama)),PDO::PARAM_STR);
        $update_stmt->bindValue(':kelas', htmlspecialchars(strip_tags($post_kelas)),PDO::PARAM_STR);
        $update_stmt->bindValue(':jurusan', htmlspecialchars(strip_tags($post_jurusan)),PDO::PARAM_STR);
        $update_stmt->bindValue(':alamat', htmlspecialchars(strip_tags($post_alamat)),PDO::PARAM_STR);
        $update_stmt->bindValue(':notelp', htmlspecialchars(strip_tags($post_notelp)),PDO::PARAM_STR);
        $update_stmt->bindValue(':angkatan', htmlspecialchars(strip_tags($post_angkatan)),PDO::PARAM_STR);
        $update_stmt->bindValue(':password', htmlspecialchars(strip_tags($post_password)),PDO::PARAM_STR);
        $update_stmt->bindValue(':email', htmlspecialchars(strip_tags($post_email)),PDO::PARAM_STR);
        $update_stmt->bindValue(':id', $post_id,PDO::PARAM_INT);
        
        
        if($update_stmt->execute()){
            $apiResponse['success']=true;
            $apiResponse['code']=200;
            $apiResponse['messages'] = 'Data updated successfully';
        }else{
            $apiResponse['success']=false;
            $apiResponse['code']=100;
            $apiResponse['messages'] = 'Failed to update data';
        }   
        
    }
    else{
        $apiResponse['messages'] = 'Invalid ID';
    }  
    
    echo  json_encode($apiResponse);
    
}
?>