<?php 
if ($_SERVER["REQUEST_METHOD"] == "POST") {
	$data = $_POST['data'];
	$sdata = fopen("data", "w") or die("Failed making tmp file");
	fwrite($sdata, $data);
	fclose($sdata);
} else {
	$sdata = fopen("data", "r") or die ("Unable to open file!");
	echo fread($sdata, filesize("data"));
	fclose($sdata);
}
?>