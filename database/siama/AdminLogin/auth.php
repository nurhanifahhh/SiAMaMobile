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
if(isset($data->nid) && isset($data->password)){
    
    $apiResponse['success']=false;
    $apiResponse['code']=200;
    $apiResponse['messages']="";
    $apiResponse['content']=null;
    $nid = $data->nid;
    $password = $data->password;
    
    //GET POST BY ID FROM DATABASE
    $get_post = "SELECT * FROM `adminaccount` WHERE nid=:nid AND password=:password";
    $get_stmt = $conn->prepare($get_post);
    $get_stmt->bindValue(':nid', $nid,PDO::PARAM_STR);
    $get_stmt->bindValue(':password', $password,PDO::PARAM_STR);
    $get_stmt->execute();

    //CHECK WHETHER THERE IS ANY POST IN OUR DATABASE
    if($get_stmt->rowCount() > 0){
            while($row = $get_stmt->fetch(PDO::FETCH_ASSOC)){
                $post_data = [
                    'id' => $row['id'],
                    'nid' => $row['nid'],
            'nama_dosen' => $row['nama_dosen'],
            'jenismatkul' => $row['jenismatkul'],
            'password' => $row['password']
                 ];
        
        }

        $apiResponse['success']=true;
        $apiResponse['messages'] = 'Admin Logged';
        // PUSH POST DATA IN OUR $posts_array ARRAY
        $apiResponse['content']=$post_data;

        echo json_encode($apiResponse);
    }
    else{
		$apiResponse['success']=false;
        $apiResponse['messages'] = 'Invalid NID or Password';
        echo json_encode($apiResponse);
    }
}
?>