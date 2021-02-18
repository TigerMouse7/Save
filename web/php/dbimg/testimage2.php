<?php
/*
imagecreatetruecolor () 는 지정된 크기의 검은 색 이미지를 나타내는 이미지 식별자를 반환합니다.
imagecreatefromjpeg — 파일 또는 URL에서 새 이미지 만들기
imagecopyresampled — 리샘플링을 사용하여 이미지의 일부를 복사 및 크기 조정*/

/*$files= 'temp/cQ.png';
echo "$files";

$newimg = 'temp/thumbnail/testimage2cQ.png';
$size = 500;
$size2 = 500;*/

//resize_image($files, $newimg, $size, $size2);

$fn = date("YmdHis");

function resize_image($file, $newfile, $w, $h) {
   list($width, $height) = getimagesize($file);
   
   if(strpos(strtolower($file), ".jpg"))
      $src = imagecreatefromjpeg($file); //검은색 이미지로 새로운

   else if(strpos(strtolower($file), ".png"))
      $src = imagecreatefrompng($file);

   else if(strpos(strtolower($file), ".gif"))
      $src = imagecreatefromgif($file);
      
   $dst = imagecreatetruecolor($w, $h);
   imagecopyresampled($dst, $src, 0, 0, 0, 0, $w, $h, $width, $height);

   if(strpos(strtolower($newfile), ".jpg"))
      imagejpeg($dst, $newfile);

   else if(strpos(strtolower($newfile), ".png"))
      imagepng($dst, $newfile);
      
   else if(strpos(strtolower($newfile), ".gif"))
      imagegif($dst, $newfile);
}

?>