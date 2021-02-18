<?php

include $_SERVER['DOCUMENT_ROOT']."/a/db.php";

//각 변수에 write.php에서 input name값들을 저장한다
$tmpfile =  $_FILES['b_file']['tmp_name'];
$username = $_POST['name'];
$userpw = password_hash($_POST['pw'], PASSWORD_DEFAULT);
$title = $_POST['title'];
$content = $_POST['content'];
$date = date('Y-m-d');
move_uploaded_file($tmpfile,$folder);

if(isset($_POST['lockpost'])){
	$lo_post = '1';
}else{
	$lo_post = '0';
}

if($username && $userpw && $title && $content){
    $sql = mq("insert into board(name,pw,title,content,date,lock_post,file) values('".$username."','".$userpw."','".$title."','".$content."','".$date."','".$lo_post."','".$o_name."')");?>
    <script type="text/javascript">alert("글쓰기 완료되었습니다.");</script>
    <meta http-equiv="refresh" content="0 url=/" />
    <?php
    echo "<script>
    alert('글쓰기 완료되었습니다.');
    location.href='/a/board.php';</script>";
}else{
    echo "<script>
    alert('글쓰기에 실패했습니다.');
    history.back();</script>";
}
?>