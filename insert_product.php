<?php
if (!isset($_POST)) {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
    die();
}

if (!isset($_POST)) {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
    die();
}
include_once("dbconnect.php");
$hsownerid = $_POST['hsidowner'];
$hsname = $_POST['hsname'];
$hsdesc = $_POST['hsdesc'];
$hsprice = $_POST['hsprice'];
$hsqty = $_POST['hsqty'];
$hsstate = $_POST['hsstate'];
$hslocality = $_POST['hslocality'];
$_lat = $_POST['_lat'];

$encoded_string = $_POST['image'];
$sqlinsert = "INSERT INTO tbl_products
(hsidowner,hsname,hsprice,hsqty,hsstate,hslocality,_lat)
VALUES('$ownerid','$hsname','$hsdesc','$hsprice','$hsqty','$hsstate','$hslocality','$_lat')";
if ($conn->query($sqlinsert) === TRUE) {
    $response = array('status' => 'success', 'data' => null);
    $decoded_string = base64_decode($encoded_string);
    $filename = mysqli_insert_id($conn);
    $path = '../images/products/'.$filename.'.jpg';
    $is_written = file_put_contents($path, $decoded_string);
sendJsonResponse($response);
} else {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
}
function sendJsonResponse($sentArray)
{
    header('Content-Type: application/json');
    echo json_encode($sentArray);
}
?>