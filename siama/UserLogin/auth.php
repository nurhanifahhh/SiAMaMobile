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
if(isset($data->nim) && isset($data->password)){
    
    $apiResponse['success']=false;
    $apiResponse['code']=200;
    $apiResponse['messages']="";
    $apiResponse['content']=null;
    $nim = $data->nim;
    $password = $data->password;
    
    //GET POST BY ID FROM DATABASE
    $get_post = "SELECT * FROM `user_account` WHERE nim=:nim AND password=:password";
    $get_stmt = $conn->prepare($get_post);
    $get_stmt->bindValue(':nim', $nim,PDO::PARAM_STR);
    $get_stmt->bindValue(':password', $password,PDO::PARAM_STR);
    $get_stmt->execute();

    //CHECK WHETHER THERE IS ANY POST IN OUR DATABASE
    if($get_stmt->rowCount() > 0){
            while($row = $get_stmt->fetch(PDO::FETCH_ASSOC)){
                $post_data = [
                    'id' => $row['id'],
                    'nim' => $row['nim'],
            'nama' => $row['nama'],
            'kelas' => $row['kelas'],
            'jurusan' => $row['jurusan'],
            'alamat' => $row['alamat'],
            'notelp' => $row['notelp'],
            'angkatan' => $row['angkatan'],
            'password' => $row['password'],
            'email' => $row['email']
                 ];
        
        }

        $apiResponse['success']=true;
        $apiResponse['messages'] = 'User Logged';
        // PUSH POST DATA IN OUR $posts_array ARRAY
        $apiResponse['content']=$post_data;

        echo json_encode($apiResponse);
    }
    else{
		$apiResponse['success']=false;
        $apiResponse['messages'] = 'Invalid NIM or Password';
        echo json_encode($apiResponse);
    }
}
?>