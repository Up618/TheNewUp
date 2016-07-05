<#import "/template/bootstrap.ftl" as bootstrap>
<html style="position:relative;min-height:100%;">
<@bootstrap.head title="这是首页"></@bootstrap.head>
<@bootstrap.body>
<div class="container" style="padding-top:60px">
	<div class="col-lg-3 col-md-3 col-sm-3">
		<div class="thumbnail">
			<a href="<@s.url namespace="/user" action="${user.getId()}" />"><img src="${user.getAvatar()}" alt="头像"></a>
			<div class="caption">
				<a href="<@s.url namespace="/user" action="${user.getId()}" />">
				<li class="list-group-item">
					<span class="badge">${user.getWeiboAmount()}</span>
					Weibos
				</li>
			</a>
			<li class="list-group-item">
				<span class="badge">14</span>
				Following
			</li>
			<li class="list-group-item">
				<span class="badge">14</span>
				Followers
			</li>
		</div>
	</div>
</div>
<div class="col-md-9 col-sm-9 com-xs-12 col-lg-9">
</div>
</div>
</@bootstrap.body>
</html>
