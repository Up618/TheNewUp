<#import "/template/bootstrap.ftl" as bootstrap>
<#import "/template/usercard.ftl" as bootstrap_usercard>
<html style="position:relative;min-height:100%;">
<@bootstrap.head title="关注"></@bootstrap.head>
<@bootstrap.body>
<div class="container" style="padding-top:60px">
	<div class="row">
		<@bootstrap_usercard.user_card_lg user=user />
	</div>
	 <div class="row">
	 
		<div class="col-sm-1 col-md-1 col-lg-1">	
		</div>
		<div class="row col-lg-10">
		<div class="col-sm-3 col-md-3 col-lg-3">	
			<@bootstrap.user_sidebar user=user.getUser() />
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9">
		<div class="list-group-item row" style="padding:0 0 0 15">
			<h5>全部关注：${followAmount}</h5>
			</div>
			<div class="list-group">
			<#list users as user>
				<@bootstrap_usercard.fans_follow_card user=user/>
					<#else>
					<h1>还没有关注任何人哦！</h1>
				</#list>
			</div>
		</div>
	</div>
	</div>
</div>
</@bootstrap.body>



<@bootstrap.javascript>

</@bootstrap.javascript>
</html>