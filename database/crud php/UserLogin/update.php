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
if(isset($data->nim)){
    
    $msg['message'] = '';
    $post_id = $data->nim;
    
    //GET POST BY ID FROM DATABASE
    $get_post = "SELECT * FROM `user_account` WHERE nim=:post_id";
    $get_stmt = $conn->prepare($get_post);
    $get_stmt->bindValue(':post_id', $post_id,PDO::PARAM_STR);
    $get_stmt->execute();
    
    
    //CHECK WHETHER THERE IS ANY POST IN OUR DATABASE
    if($get_stmt->rowCount() > 0){
        
        // FETCH POST FROM DATBASE 
        $row = $get_stmt->fetch(PDO::FETCH_ASSOC);
        
        // CHECK, IF NEW UPDATE REQUEST DATA IS AVAILABLE THEN SET IT OTHERWISE SET OLD DATA
        $post_nim = isset($data->nim) ? $data->nim : $row['nim'];
        $post_password = isset($data->password) ? $data->password : $row['password'];
        $post_status = isset($data->status) ? $data->status : $row['status'];
        
        $update_query = "UPDATE `user_account` SET password = :password 
        WHERE nim = :nim";
        
        $update_stmt = $conn->prepare($update_query);
        
        // DATA BINDING AND REMOVE SPECIAL CHARS AND REMOVE TAGS
        $update_stmt->bindValue(':nim', htmlspecialchars(strip_tags($post_nim)),PDO::PARAM_STR);
	$update_stmt->bindValue(':password', htmlspecialchars(strip_tags($post_password)),PDO::PARAM_STR);
   
        
        
        if($update_stmt->execute()){
            $msg['message'] = 'Data updated successfully';
        }else{
            $msg['message'] = 'data not updated';
        }   
        
    }
    else{
        $msg['message'] = 'Invlid ID';
    }  
    
    echo  json_encode($msg);
    
}
?>