<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<?php
include "D:\Software_Tool\php-xampp\htdocs\dbimg2\db_connect.php";

$result = $connect->query("select * from test_bbs");
$result2 = $connect->query("select filename from test_image");
//echo "<img src='/dbimg2/temp/c8.png'/>";

echo "<img src='/dbimg2/temp/thumbnail/writ1.png'/>";

echo "<table border=1>";
while($row = $result->fetch_assoc()) {
	echo "<tr>";
	echo "<td>".$row['bbsNo']."</td>";
	echo "<td>".$row['id']."</td>";
	echo "<td><a href='view.php?bbsno=".$row['bbsNo']."'>".$row['content']."</a></td>";
	echo "<td>".$row['regdate']."</td>";
	echo "</tr>";
}


while($row2 = $result2->fetch_assoc()){
	echo "<tr>";
	echo "<td>".$row2['filename']."</td>";
	echo "<tr>";
}

?>
