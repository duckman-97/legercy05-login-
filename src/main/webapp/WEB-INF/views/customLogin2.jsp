













<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
 <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link href = "/resources/vender/bootstrap/css/bootstrap.min.css"
rel = "stylesheet">



<link href = "/resources/vender/metisMenu/metisMenu.min.css"
rel="stylesheet">


<link href = "/resources/disk/css/sb-admin-2.css" rel="stylesheet">

<link href = "/resources/vendor/font-awesome/css/font-awesome.min.css" rel = "stylesheet" type="text/css">








</head>
<body>


<h1>Custom Login Page</h1>

<h2><c:out value = "${error}"/></h2>
<h2><c:out value = "${logout}"/></h2>


<form role = "form" method  = 'post' action = "/login">
<fieldset>
<div class= "form-group">
<input class = "form-control" placeholder = "userid" name = "username" type = "text" autofocus></div>
<div class = "form-group">
<input class = "form-control" placeholder="Password" name = "password" type = "password" value="">

</div>
<div class = "checkbox">
<label><input name = "remember-me" type = "checkbox">Remember Me</label>

</div>

<a href="index.html" class="btn btn-lg btn-success btn-block">Login</a>




</fieldset>
<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />
</form>

<!--
<form method = 'post' action = "/login">


<div>

<input type ='text' name = 'username' value = 'admin'>


</div>
<div>
<input type = 'password' name = 'password' value = 'admin'>

</div>
<div>
<input type = 'checkbox' name = 'remember-me'>Remember Me
</div>
<div>
<input type = 'submit'>
</div>
<input type = "hidden" name = "${_csrf.parameterName}" value = "${_csrf.token}" />



</form>

-->



<script src= "/resources/vender/jquery.min.js"></script>

<script src= "/resources/vender/bootstrap/js/bootstrap.min.js"></script>


<script src= "/resources/vender/metisMenu.min.js"></script>


<script src= "/resources/disk/js/sb-admin-2.js"></script>


<script>
$(".btn-success").on("click",function(e){
	e.preventDefualt();
	$("form").submit;
	
})
</script>

</body>
</html>

