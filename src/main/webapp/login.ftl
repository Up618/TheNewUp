<#import "/template/bootstrap.ftl" as bootstrap>
<html style="position:relative;min-height:100%;">
<@bootstrap.head title="登陆">
	<link href="http://v3.bootcss.com/examples/signin/signin.css" rel="stylesheet">
</@bootstrap.head>
<body style="background-color:#eee">
	<div class="container" style="padding-top:40px">
		<div class="form-signin">
		<ul class="nav nav-tabs">
  			<li role="presentation" class="active"><a href="javascript:showIn()">Sign in</a></li>
  			<li role="presentation"><a href="javascript:showUp()">Sign up</a></li>
		</ul>
		<form id="in" action="<@s.url namespace="/" action="login" />" method="post">
    		<label class="sr-only" for="Username">Username</label>
    		<input type="text" class="form-control" name="username" placeholder="Username" required>
    		<label class="sr-only" for="Password">Password</label>
    		<input type="password" class="form-control" name="password" placeholder="Password" required>
  			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
  			<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
		</form>
		<form id="up" action="<@s.url namespace="/" action="register" />" method="post" style="display:none;">
    		<label class="sr-only" for="Username">Username</label>
    		<input type="text" class="form-control" name="username" placeholder="Username" required>
    		<label class="sr-only" for="Username">Username</label>
    		<input type="text" class="form-control" name="nickname" placeholder="Nickname" required>
    		<label class="sr-only" for="Password">Password</label>
    		<input type="password" class="form-control" name="password" placeholder="Password" required>
    		<label class="sr-only" for="Password">Password</label>
    		<input type="password" class="form-control" name="passwordAgain" placeholder="PasswordAgain" required>
    		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
  			<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
		</form>
		</div>
	</div>
</body>
<script>
	$(document).ready(function(){
  		
	});
		function showIn(){
  			$("#up").hide();
  			$("#in").show();
  			$(".form-signin ul li:eq(1)").removeClass("active");
  			$(".form-signin ul li:eq(0)").addClass("active");
  		};
  		function showUp(){
  			$("#up").show();
  			$("#in").hide();
  			$(".form-signin ul li:eq(0)").removeClass("active");
  			$(".form-signin ul li:eq(1)").addClass("active");
  		};
</script>
<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
	<script src="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/js/jasny-bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</html>