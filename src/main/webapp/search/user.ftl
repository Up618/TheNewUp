<#import "/template/bootstrap.ftl" as bootstrap>
<html style="position:relative;min-height:100%;">
<#import "/template/usercard.ftl" as bootstrap_usercard>
<@bootstrap.head title="搜索用户"></@bootstrap.head>
<@bootstrap.body>
<div class="container" style="padding-top:60px">
	<div class="row">
	
	</div>
	<div class="row">
		<div class="col-sm-9 col-sm-offset-2 col-md-8 col-md-offset-3 col-lg-7 col-lg-offset-4">
			<div class="list-group">
				<#list users as user>
					<@bootstrap_usercard.user_card_lg user=user/>
				</#list>
			</div>
		</div>
	</div>
</div>
</@bootstrap.body>
<@bootstrap.javascript/>
</html>
