<#import "/template/bootstrap.ftl" as bootstrap>
<html style="position:relative;min-height:100%;">
<@bootstrap.head title="登陆">
	<link href="http://v3.bootcss.com/examples/signin/signin.css" rel="stylesheet">
</@bootstrap.head>
<body style="background-color:#eee">
	<div class="container" style="padding-top:40px">
		<form action="./login" method="post" class="form-signin">
		<ul class="nav nav-tabs">
  			<li role="presentation" class="active"><a href="#">Sign in</a></li>
  			<li role="presentation"><a href="#">Sign up</a></li>
		</ul>
    		<label class="sr-only" for="Username">Username</label>
    		<input type="text" class="form-control" id="username" name="username" placeholder="Username">
    		<label class="sr-only" for="Password">Password</label>
    		<input type="password" class="form-control" id="password" name="password" placeholder="Password">
  			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
  			<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
		</form>
	</div>
</body>
</html>