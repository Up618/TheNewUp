<#import "/template/bootstrap.ftl" as bootstrap>
<#import "../template/usercard.ftl" as bootstrap_usercard>
<html style="position:relative;min-height:100%;">
<@bootstrap.head title="查看用户"></@bootstrap.head>
<@bootstrap.body>
<div class="container" style="padding-top:60px">
	<div class="row">

	</div>
	<div class="row">
		<div class="col-sm-9 col-sm-offset-2 col-md-8 col-md-offset-3 col-lg-7 col-lg-offset-4">
			<div class="list-group">
				<#list users as user>
					<@bootstrap_usercard.user_card_admin user=user/>
				</#list>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function () {
		var prebt =	document.getElementById("previousBtn");
		var nexbt = document.getElementById("nextBtn");
		if(${page} == 1 &&${users.size()}<10){
		$("#previousBtn").hide();
		$("#nextBtn").hide();
		}else{
			if(${page} > 1){
				prebt.disabled = false;
			}else{
				prebt.disabled=true;		}
			if(${users.size()}<10){
				nexbt.disabled = true;
			}else{
				nexbt.disabled = false;
			}
		}
	});
</script>
</@bootstrap.body>
<@bootstrap.javascript/>
</html>