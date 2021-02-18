<?php

$files= 'cA.png';
echo "$files";
$newimg = 'testimage211111.png';
$size = 500;
$size2 = 500;

resize_image($files, $newimg, $size, $size2);

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