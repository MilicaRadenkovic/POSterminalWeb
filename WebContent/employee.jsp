<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Employee login</title>
 <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
 <script  type="text/javascript"></script>
    <script type="text/javascript">
        $(function() {
            $("#pass").focus();
        });
    </script>
</head>
<body>
	<center>
	<form action="Login">
		Pin: <input id="pass" class="w3-input" type="password" name="pass"><br>
		First name: <input  class="w3-input"type="text" name="name"><br>
		Last name:  <input class="w3-input" type="text" name="surname"><br><br>
		<input  type="submit"  class="btn btn=default" value="LOGIN">
	</form>
	</center>
</body>
</html>