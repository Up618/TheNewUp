<#import "/template/bootstrap.ftl" as bootstrap>
<#import "/template/usercard.ftl" as bootstrap_usercard>
<#list fans as user>
	<@bootstrap_usercard.fans_follow_card user=user/>
<#else>
	<h1>还没有任何粉丝哦！</h1>
</#list>

<script type="text/javascript">
	$(document).ready(function () {
		var prebt =	document.getElementById("previousBtn");
		var nexbt = document.getElementById("nextBtn");
		if(${page} > 1){
			prebt.disabled = false;
		}else{
			prebt.disabled=true;		}
		if(${fans.size()}<10){
			nexbt.disabled = true;
		}else{
			nexbt.disabled = false;
		}
	});
	
</script>