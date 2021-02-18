<?php
/*
$filename: 업로드된 파일명
$destionation: 이동할 위치*/


move_uploaded_file($filename ,$destination);

move_uploaded_file($_FILES['imageform']['tmp_name'],$_SERVER['DOCUMENT_ROOT'].$path.$suchfile);
?>