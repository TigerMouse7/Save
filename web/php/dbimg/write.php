<?php
include "D:\Software_Tool\php-xampp\htdocs\dbimg2\db_connect.php";
include "D:/Software_Tool/php-xampp/htdocs/dbimg2/testimage2.php";

$id = $_POST['id'];
$content = $_POST['content'];

$query = "insert into test_bbs (id,content) values('$id','$content')";
$connect->query($query);

$bbsid = $connect->insert_id;

//$path = $_SERVER['DOCUMENT_ROOT'].'/dbimg2/temp/';
$path = '/dbimg2/temp/';
//echo $suchfile;

$suchfile = $_FILES['imageform']['name'];
$suchfile2 = $path.$_FILES['imageform']['name'];
// $suchfile = $path.basename($_FILES['imageform']['name']);
//echo "$path <br>";
//$path = "/dbimg2";
// $filename =  date("YmdHis").".png"; //imageform insert later..
move_uploaded_file($_FILES['imageform']['tmp_name'],$_SERVER['DOCUMENT_ROOT'].$path.$suchfile);
$query = "insert into test_image (bbsNo,path,filename) values ('$bbsid', '$path','$suchfile')";
$connect->query($query);

$path2 = $_SERVER['DOCUMENT_ROOT'].$path.$_FILES['imageform']['name'];
//나중에 시간명하고 파일명 같이 출력하는거 만들기

$newimage = 'temp/thumbnail/v1.png';
//echo "$path2";
//echo $newimage;

$width_size=75;
$height_size=75;

echo $_SERVER['DOCUMENT_ROOT'].$path;
$fn = date("YmdHis");


resize_image($path2, $newimage, $width_size, $height_size);

// $get_query = "select * from test_bbs where id=".$bbsid;

// $get_query_result = mysqli_query($connect, $get_query);
// while($row = mysqli_fetch_assoc($get_query_result)){
// 	$get_id = $row['id'];
// 	$get_content = $row['content'];
// }
?>
<html>
<head>
	<meta enctype="multipart/form-data" http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>게시물 작성 예제 폼</title>
</head>
<body>
<table>
<tr>
	<td>전송아이디:</td>
	<td><?=$id;?></td>
</tr>
<tr>
	<td>전송내용:</td>
	<td><?=$content;?></td>
</tr>
<tr>
	<td>전송이미지</td>
	<td><img src="<?=$path.$suchfile;?>" /></td>
</tr>
</table>
<p><b>전송완료</b></p>
<p><a href='list.php'>목록가기</a></p>
</body>
</html>

