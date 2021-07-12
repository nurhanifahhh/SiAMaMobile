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
if(isset($data->id_matakuliah)){
    
    $apiResponse['success']=false;
    $apiResponse['code']=200;
    $apiResponse['messages']="";
    $apiResponse['content']=null;
    $post_id_matakuliah = $data->id_matakuliah;
    
    //GET POST BY ID FROM DATABASE
    $get_post = "SELECT * FROM `jadwal_kuliah` WHERE id_matakuliah=:post_id_matakuliah";
    $get_stmt = $conn->prepare($get_post);
    $get_stmt->bindValue(':post_id_matakuliah', $post_id_matakuliah,PDO::PARAM_STR);
    $get_stmt->execute();
    
    
    //CHECK WHETHER THERE IS ANY POST IN OUR DATABASE
    if($get_stmt->rowCount() > 0){
        
        // FETCH POST FROM DATBASE 
        $row = $get_stmt->fetch(PDO::FETCH_ASSOC);
        
        // CHECK, IF NEW UPDATE REQUEST DATA IS AVAILABLE THEN SET IT OTHERWISE SET OLD DATA
        $post_id_matakuliah = isset($data->id_matakuliah) ? $data->id_matakuliah: $row['id_matakuliah'];
        $post_nama_matakuliah = isset($data->nama_matakuliah) ? $data->nama_matakuliah : $row['nama_matakuliah'];
        $post_id_jadwalkuliah = isset($data->id_jadwalkuliah) ? $data->id_jadwalkuliah : $row['id_jadwalkuliah'];
        $post_hari = isset($data->hari) ? $data->hari : $row['hari'];
        $post_tanggal = isset($data->tanggal) ? $data->tanggal : $row['tanggal'];
        $post_waktu = isset($data->waktu) ? $data->waktu : $row['waktu'];
        $post_dosen_pengajar = isset($data->dosen_pengajar) ? $data->dosen_pengajar : $row['dosen_pengajar'];
        
        $update_query = "UPDATE `jadwal_kuliah` SET id_matakuliah = :id_matakuliah, nama_matakuliah = :nama_matakuliah, id_jadwalkuliah = :id_jadwalkuliah, hari = :hari, tanggal = :tanggal, waktu = :waktu, dosen_pengajar = :dosen_pengajar, WHERE id_matakuliah = :id_matakuliah";
        
        $update_stmt = $conn->prepare($update_query);
        
        // DATA BINDING AND REMOVE SPECIAL CHARS AND REMOVE TAGS
        $update_stmt->bindValue(':id_matakuliah', htmlspecialchars(strip_tags($post_id_matakuliah)),PDO::PARAM_STR);
        $update_stmt->bindValue(':nama_matakuliah', htmlspecialchars(strip_tags($post_nama_matakuliah)),PDO::PARAM_STR);
        $update_stmt->bindValue(':id_jadwalkuliah', htmlspecialchars(strip_tags($post_id_jadwalkuliah)),PDO::PARAM_STR);
        $update_stmt->bindValue(':hari', htmlspecialchars(strip_tags($post_hari)),PDO::PARAM_STR);
        $update_stmt->bindValue(':tanggal', htmlspecialchars(strip_tags($post_tanggal)),PDO::PARAM_STR);
        $update_stmt->bindValue(':waktu', htmlspecialchars(strip_tags($post_waktu)),PDO::PARAM_STR);
        $update_stmt->bindValue(':dosen_pengajar', htmlspecialchars(strip_tags($post_dosen_pengajar)),PDO::PARAM_STR);
        
        
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