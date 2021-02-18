<?php
$mystring = 'abc';
$findme   = 'a';
$pos = strpos($mystring, $findme);

// Note our use of ===.  Simply == would not work as expected
// because the position of 'a' was the 0th (first) character.
if ($pos === false) {
    echo "The string '$findme' was not found in the string '$mystring'<br>";
} else {
    echo "The string '$findme' was found in the string '$mystring'<br>";
    echo " and exists at position $pos";
}
echo "<br><br>";

$categoryName = "전국 > 부산 > 서면";  
$searchName = "서울";  
  
if(strpos($categoryName, $searchName) !== false) {  
    echo "포함되어 있습니다만...";  
} else {  
    echo "없군요.";  
}  
?>