<#import "/template/bootstrap.ftl" as bootstrap>
<#import "/template/usercard.ftl" as bootstrap_usercard>
<html style="position:relative;min-height:100%;">
<@bootstrap.head title="粉丝"></@bootstrap.head>
<@bootstrap.body>
<div class="container" style="padding-top:60px">
	<@bootstrap_usercard.user_card_lg user=user />
	<div class="col-sm-4 col-md-3 col-lg-3 col-md-offset-1 col-lg-offset-1" style="padding-left:0px">
		<@bootstrap.user_sidebar user=user.getUser() />
	</div>
	<script>
	$(document).ready(function () {
		$("#fans-btn").removeClass().addClass("upSidebar-active");
	});
	</script>
	<div class="col-sm-8 col-md-7 col-lg-7">
		<div class="list-group-item row" style="padding:0 0 0 15">
			<h5>粉丝数：${fansAmount}</h5>
		</div>
		<div class="list-group">
			<#list fans as user>
			<@bootstrap_usercard.fans_follow_card user=user/>
			<#else>
			<h1>还没有任何粉丝哦！</h1>
			</#list>
		</div>
	</div>
</div>

</@bootstrap.body>

<@bootstrap.javascript>

</@bootstrap.javascript>
</html>
