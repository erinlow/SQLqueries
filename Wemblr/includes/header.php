<?php 

require 'config/config.php';
include("includes/classes/User.php");
include("includes/classes/Post.php");

if(isset($_SESSION['username'])){
	$userLoggedIn = $_SESSION['username'];
	$user_details_query = mysqli_query($con, "SELECT * FROM users WHERE username = '$userLoggedIn'");
	$user = mysqli_fetch_array($user_details_query);
}
else{ //User is not logged in
	header("Location: register.php");
}

?>


<html>
<head>
	<title>Wemblr</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

	<!-- Javascript -->
	<script src="assets/js/bootstrap.js"></script>

	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="assets/css/style.css">
	<link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">

</head>
<body>

	<div class="top_bar">
		<div class="logo">
			<a href="index.php">Wemblr</a>
		</div>

		<nav>
			<a href="#">Home</a>
			<a href="<?php echo $userLoggedIn; ?>">
				<?php echo $user['first_name']; ?>
			</a>
			<a href="includes/handlers/logout.php">Logout</a>

		</nav>

	</div><!-- End .top_bar-->

	<div class="wrapper">

