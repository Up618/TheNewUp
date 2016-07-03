<#import "/template/bootstrap.ftl" as bootstrap>
<html style="position:relative;min-height:100%;">
<@bootstrap.head title="搜索用户"></@bootstrap.head>
<@bootstrap.body>
<div class="container" style="padding-top:60px">
	<div class="row">
	
	</div>
	<div class="row">
		<div class="col-sm-3 col-md-3 col-lg-3">
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9">
			<div class="list-group">
				<#list users as user>
				</#list>
			</div>
		</div>
	</div>
</div>
</@bootstrap.body>
</html>