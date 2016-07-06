<#import "/template/bootstrap.ftl" as bootstrap>
<html style="position:relative;min-height:100%;">
<@bootstrap.head title="粉丝"></@bootstrap.head>
<@bootstrap.body>
<div class="container row" style="padding-top:60px">
		<div class=" col-lg-3">
			<h1>aaaaa</h1>
			<h3>关注：${followAmount}</h3>
			<h3>粉丝：${fansAmount}</h3>
		</div>
			
	<div class="row col-lg-9">
		<div class="col-sm-3 col-md-3 col-lg-3">
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9">
		<div>
			<h5>粉丝数：${fansAmount}</h5>
		</div>
			<div class="list-group">
				<#list fans as user>
					<@bootstrap.user_card user=user/>
				</#list>
			</div>
		</div>
	</div>
</div>
</@bootstrap.body>
</html>