<?php
include("includes/header.php");

if(isset($_GET['profile_username'])){
	$username = $_GET['profile_username'];
	$user_details_query = mysqli_query($con, "SELECT * FROM users WHERE username='$username'");
	$user_array = mysqli_fetch_array($user_details_query);

	$num_following = (substr_count($user_array['following_array'], ",")) -1;
}


if(isset($_POST['unfollow'])) {
	$user = new User($con, $userLoggedIn);
	$user->unFollow($username);
}

if(isset($_POST['follow'])) {
	$user = new User($con, $userLoggedIn);
	$user->follow($username);
}


?>

	<style type="text/css">
		.wrapper {
			margin-left: 0px;
    		padding-left: 0px;
		}

	</style>

	<div class="profile_left">
		<img src="<?php echo $user_array['profile_pic']; ?>">

		<div class="profile_info">
			<p><?php echo "Posts: " . $user_array['num_posts']; ?></p>
			<p><?php echo "Following: " . $num_following; ?></p>
		</div>

		<form action="<?php echo $username; ?>" method="POST">
			<?php 
			$profile_user_obj = new User($con, $username); 
			if($profile_user_obj->isClosed()) { 
				header("Location: user_closed.php");
			}

			$loggedin_user_obj = new User($con, $userLoggedIn); 

			if($userLoggedIn != $username){

				if($loggedin_user_obj->isFollowing($username)){
					echo '<input type="submit" name="unfollow" class="danger" value="Unfollow"><br>';
				}
				else{
					echo '<input type="submit" name="follow" class="success" value="Follow"><br>';
				}
			}

			?>
		</form>


	</div>

	<div class="user_details column">
		This is <?php echo $username; ?>'s profile page!

	</div>

</div> <!-- end .wrapper -->
</body>
</html>