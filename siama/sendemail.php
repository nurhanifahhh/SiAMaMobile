<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
//set Gmail less secure to -> on

session_start();

/*if(isset($_POST['send'])){
	$email = $_POST['email'];
	$subject = $_POST['subject'];
	$message = $_POST['message'];	
}
*/

//Load Composer AutoLoader
require 'lib/PHPMailer/src/Exception.php';
require 'lib/PHPMailer/src/PHPMailer.php';
require 'lib/PHPMailer/src/SMTP.php';

$mail = new PHPMailer(true);

try{
	//Server Settings
	$mail->isSMTP();
	$mail->Host = 'smtp.gmail.com';
	$mail->SMTPAuth = true;
	$mail->Username = 'siamaserviceapp@gmail.com';
	$mail->Password = 'siama2020#';
	$mail->SMTPOptions = array(
			'ssl' => array(
			'verify_peer' => false,
			'verify_peer_name' => false,
			'allow_self_signed' => true
		)
	);
	$mail->SMTPSecure = 'ssl';
	$mail->Port = 465;

	//Send Email
	$mail->setFrom('siamaserviceapp@gmail.com');

	//Recipient
	$mail->addAddress('farelalrez@gmail.com');

	//Content
	$mail->isHTML(true);
	$mail->Subject = 'Reset Password For Siama';
	$mail->Body = 'Your code is ...<br> <b>Test Succeed</b>';

	$mail->send();

	$_SESSION['result'] = 'Message is sent';
	$_SESSION['status'] = 'OK';	
	
	} catch (Exception $e){
		$_SESSION['result'] = 'Message could not be sent. Mailer Error: '.$mail->ErrorInfo;
		$_SESSION['status']='Error';
	}
echo $_SESSION['result'];
//}
?>

