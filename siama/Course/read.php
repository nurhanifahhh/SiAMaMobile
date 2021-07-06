<?php
// SET HEADER
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header("Content-Type: application/json; charset=UTF-8");

// INCLUDING DATABASE AND MAKING OBJECT
require '../database.php';
$db_connection = new Database();
$conn = $db_connection->dbConnection();

$apiResponse['success']=true;
$apiResponse['code']=200;
$apiResponse['messages']="";
$apiResponse['content']=null;

// GET DATA FORM REQUEST
$data = json_decode(file_get_contents("php://input"));

if(isset($data->id_matakuliah)){
    //IF HAS ID PARAMETER
    $post_id_matakuliah = filter_var($data->id_matakuliah, FILTER_VALIDATE_INT,[
        'options' => [
            'default' => 'all_posts',
            'min_range' => 1
        ]
    ]);

}else{

    $post_id_matakuliah = 'all_posts';

}

// MAKE SQL QUERY
// IF GET POSTS ID, THEN SHOW POSTS BY ID OTHERWISE SHOW ALL POSTS
$sql = is_numeric($post_id_matakuliah) ? "SELECT * FROM `jadwal_kuliah` WHERE id_matakuliah='$post_id_matakuliah'" : "SELECT * FROM `jadwal_kuliah`"; 

$stmt = $conn->prepare($sql);

$stmt->execute();

//CHECK WHETHER THERE IS ANY POST IN OUR DATABASE
if($stmt->rowCount() > 0){
    // CREATE POSTS ARRAY
    $posts_array = [];
    
    while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        
        $post_data = [
            'id_matakuliah' => $row['id_matakuliah'],
            'nama_matakuliah' => $row['nama_matakuliah'],
            'id_jadwalkuliah' => $row['id_jadwalkuliah'],
            'hari' => $row['hari'],
            'tanggal' => $row['tanggal'],
            'waktu' => $row['waktu'],
            'dosen_pengajar' => $row['dosen_pengajar']
        ];
        // PUSH POST DATA IN OUR $posts_array ARRAY
        if(isset($data->id)){

            $apiResponse['content'] = $post_data;
        }else{
            array_push($posts_array, $post_data);
                
        }
        
    }
    if(!isset($data->id)){
        $apiResponse['content']=$posts_array;
    }
    //SHOW POST/POSTS IN JSON FORMAT
    echo json_encode($apiResponse);
 

}
else{
    $apiResponse['success']=false;
    $apiResponse['code']=200;
    $apiResponse['messages']="No Data Found";
    //IF THER IS NO POST IN OUR DATABASE
    echo json_encode($apiResponse);
}
?>