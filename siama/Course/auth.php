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
if(isset($data->id_matakuliah)){
    
    $apiResponse['success']=false;
    $apiResponse['code']=200;
    $apiResponse['messages']="";
    $apiResponse['content']=null;
    $id_matakuliah = $data->id_matakuliah;
    
    //GET POST BY ID FROM DATABASE
    $get_post = "SELECT * FROM `jadwal_kuliah` WHERE id_matakuliah=:id_matakuliah";
    $get_stmt = $conn->prepare($get_post);
    $get_stmt->bindValue(':id_matakuliah', $id_matakuliah,PDO::PARAM_STR);
    $get_stmt->execute();

    //CHECK WHETHER THERE IS ANY POST IN OUR DATABASE
    if($get_stmt->rowCount() > 0){
            while($row = $get_stmt->fetch(PDO::FETCH_ASSOC)){
                $post_data = [
                    'id_matakuliah' => $row['id_matakuliah'],
                    'nama_matakuliah' => $row['nama_matakuliah'],
            'id_jadwalkuliah' => $row['id_jadwalkuliah'],
            'hari' => $row['hari'],
            'tanggal' => $row['tanggal'],
            'waktu' => $row['waktu'],
            'dosen_pengajar' => $row['dosen_pengajar']
                 ];
        
        }

        $apiResponse['success']=true;
        $apiResponse['messages'] = 'Your COURSE';
        // PUSH POST DATA IN OUR $posts_array ARRAY
        $apiResponse['content']=$post_data;

        echo json_encode($apiResponse);
    }
    else{
		$apiResponse['success']=false;
        $apiResponse['messages'] = 'Invalid CODE COURSE';
        echo json_encode($apiResponse);
    }
}
?>