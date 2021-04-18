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
if(isset($data->email) && isset($data->password)){
    
    $apiResponse['success']=false;
    $apiResponse['code']=200;
    $apiResponse['messages']="";
    $apiResponse['content']=null;
    $nim = $data->nim;
    $password = $data->password;
    
    //GET POST BY ID FROM DATABASE
    $get_post = "SELECT * FROM user_account WHERE nim=:id AND password=:password";
    $get_stmt = $conn->prepare($get_post);
    $get_stmt->bindValue(':nim', $nim,PDO::PARAM_STR);
    $get_stmt->bindValue(':password', $password,PDO::PARAM_STR);
    $get_stmt->execute();

    //CHECK WHETHER THERE IS ANY POST IN OUR DATABASE
    if($get_stmt->rowCount() > 0){
		$apiResponse['success']=true;
        $apiResponse['messages'] = 'User Logged';
    }
    else{
		$apiResponse['success']=false;
        $apiResponse['messages'] = 'Invalid Email or Password';
    }

    echo json_decode($apiResponse);
    
}
?>