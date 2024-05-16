<?php
require_once('connection.php');
session_start();


if (!isset($_SESSION['username'])){
   $actual_link = "$_SERVER[REQUEST_URI]";
   $_SESSION['redirect_url'] = $actual_link;
   header('location:login.php');
}

if (isset($_SESSION['active'])&&($_SESSION['active']!="1")){
    header('location:lock.php');

}
if (isset($_SESSION['redirect_url']) && isset($_SESSION['username'])) {
    $redirect = $_SESSION['redirect_url'];
    unset($_SESSION['redirect_url']);
    header('location:' . $redirect);
}
if (isset($_GET['controller'])) {
    $controller = $_GET['controller'];
    if (isset($_GET['action'])) {
        $action = $_GET['action'];
    } else {
        $action = 'index';
    }
}
    else {
        $controller = 'sanpham';
        $action = 'index';
    }
require_once('routes.php');