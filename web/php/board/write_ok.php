<?php

include $_SERVER['DOCUMENT_ROOT']."/a/db.php";

//각 변수에 write.php에서 input name값들을 저장한다
$username = $_POST['name'];
$userpw = password_hash($_POST['pw'], PASSWORD_DEFAULT);
$title = $_POST['title'];
$content = $_POST['content'];
$date = date('Y-m-d');

$tmpfile =  $_FILES['b_file']['tmp_name'];
$o_name = $_FILES['b_file']['name'];
$filename = iconv("UTF-8", "EUC-KR",$_FILES['b_file']['name']);
$folder = "D:/Software_Tool/php-xampp/htdocs/a/upload/".$filename;
move_uploaded_file($tmpfile,$folder);

$mqq = mq("alter table board auto_increment =1");

if(isset($_POST['lockpost'])){
	$lo_post = '1';
}else{
	$lo_post = '0';
}

    $sql = mq("insert into board(name,pw,title,content,date,lock_post,file) values('".$username."','".$userpw."','".$title."','".$content."','".$date."','".$lo_post."','".$o_name."')");?>
    <script type="text/javascript">alert("글쓰기 완료되었습니다.");</script>
    