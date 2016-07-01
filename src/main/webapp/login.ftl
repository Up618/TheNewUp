<#import "/template/bootstrap.ftl" as bootstrap>
<html style="position:relative;min-height:100%;">
<@bootstrap.head title="登陆"></@bootstrap.head>
<body style="background-color:#eee">
	<div class="container">
		<form action="./login" method="post">
			<div class="form-group">
    			<label class="sr-only" for="Username">Username</label>
    			<input type="text" class="form-control" id="username" name="username" placeholder="Username">
  			</div>
  			<div class="form-group">
    			<label class="sr-only" for="Password">Password</label>
    			<input type="password" class="form-control" id="password" name="password" placeholder="Password">
  			</div>
  			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
  			<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
		</form>
	</div>
</body>
</html>