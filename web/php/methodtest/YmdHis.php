<?php
$suchfile = $_FILES['imageform']['name'];

$fn = date("YmdHis");
move_uploaded_file($_FILES['imageform']['tmp_name'],$fn.$suchfile);

?>