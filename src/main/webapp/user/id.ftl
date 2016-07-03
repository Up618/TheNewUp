<#import "/template/bootstrap.ftl" as bootstrap>
<html style="position:relative;min-height:100%;">
<@bootstrap.head title="个人首页"></@bootstrap.head>
<@bootstrap.body>
<div class="container" style="padding-top:60px">
	<div class="row">
		<@bootstrap.user_card_lg user=user />
	</div>
	<div class="row">
		<div class="col-md-3 col-sm-3 col-lg-3">
			
		</div>
		<div class="col-md-9 col-sm-9 col-lg-9">
			<#list weibos as weibo>
				<@bootstrap.weibo_card weibo=weibo>
					${weibo.getContent()}
				</@bootstrap.weibo_card>
			</#list>
		</div>
	</div>
</div>
</@bootstrap.body>
</html>