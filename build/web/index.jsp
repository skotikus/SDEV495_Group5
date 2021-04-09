<%-- 
    Document   : login
    Created on : Apr 9, 2021, 12:31:56 AM
    Author     : scott
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >

<head>

  <meta charset="UTF-8">
  
<link rel="apple-touch-icon" type="image/png" href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png" />
<meta name="apple-mobile-web-app-title" content="CodePen">

<link rel="shortcut icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico" />

<link rel="mask-icon" type="" href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111" />


  <title>G5 Inventory - Login</title>
  
  
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css'>
  
<style>
.main-content{
	width: 50%;
	border-radius: 20px;
	box-shadow: 0 5px 5px rgba(0,0,0,.4);
	margin: 5em auto;
	display: flex;
        
}
.company__info{
	background-color: #4e73df;
	border-top-left-radius: 20px;
	border-bottom-left-radius: 20px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	color: #fff;
}
.fa-google{
	font-size:3em;
}
@media screen and (max-width: 640px) {
	.main-content{width: 90%;}
	.company__info{
		display: none;
	}
	.login_form{
		border-top-left-radius:20px;
		border-bottom-left-radius:20px;
	}
}
@media screen and (min-width: 642px) and (max-width:800px){
	.main-content{width: 70%;}
}
.row > h2{
	color:#008080;
}
.login_form{
	background-color: #fff;
	border-top-right-radius:20px;
	border-bottom-right-radius:20px;
	border-top:1px solid #ccc;
	border-right:1px solid #ccc;
}
form{
	padding: 0 2em;
}
.form__input{
	width: 100%;
	border:0px solid transparent;
	border-radius: 0;
	border-bottom: 1px solid #aaa;
	padding: 1em .5em .5em;
	padding-left: 2em;
	outline:none;
	margin:1.5em auto;
	transition: all .5s ease;
}
.form__input:focus{
	border-bottom-color: #008080;
	box-shadow: 0 0 5px rgba(0,80,80,.4); 
	border-radius: 4px;
}
.btn{
	transition: all .5s ease;
	width: 70%;
	border-radius: 30px;
	color:#008080;
	font-weight: 600;
	background-color: #fff;
	border: 1px solid #008080;
	margin-top: 1.5em;
	margin-bottom: 1em;
}
.btn:hover, .btn:focus{
	background-color: #008080;
	color:#fff;
}
</style>

  <script>
  window.console = window.console || function(t) {};
</script>

  
  
  <script>
  if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
  }
</script>


</head>

<body translate="no" >
  <head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>G5 - Login Page</title>
</head>
<body style="background-color: #424242">
	<!-- Main Content -->
	<div class="container-fluid">
		<div class="row main-content bg-success text-center">
			<div class="col-md-4 text-center company__info">
                            <span class="company__logo"><h2><span class="fa fa-google"><sup>5</sup></span></h2></span>
				<h4 class="company_title">Inventory Mgmt</h4>
			</div>
			<div class="col-md-8 col-xs-12 col-sm-12 login_form ">
				<div class="container-fluid">
					<div class="row">
						<h2>Log In</h2>
					</div>
					<div class="row">
                                            <% if (session.getAttribute("UserEmail") == null) {
                                            %>
						<form action="Authenticate" class="form-group" method="post">
							<div class="row">
								<input type="text" name="emailAddress" id="username" class="form__input" placeholder="Username">
							</div>
							<div class="row">
								<!-- <span class="fa fa-lock"></span> -->
								<input type="password" name="pfield" id="password" class="form__input" placeholder="Password">
							</div>
							
							<div class="row">
								<input type="submit" value="Submit" name="SignIn" class="btn">
							</div>
                                                    <!-- Print Error Message if any -->
                                                    <% String e = (String) request.getAttribute("ErrorMessage");
                                                        if (e != null) {
                                                            out.print(e);
                                                        }
                                                    %>
						</form>
                                                <%
                                                    } else {
                                                        request.setAttribute("ErrorMessage", "You are already logged in.");
                                                        RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
                                                        dispatcher.forward(request, response);                    
                                                    }
                                                %>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
  
  
  
  

</body>

</html>
 
