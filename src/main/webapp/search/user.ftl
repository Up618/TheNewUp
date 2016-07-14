<#import "/template/bootstrap.ftl" as bootstrap>
<#import "../template/usercard.ftl" as bootstrap_usercard>
<#list users as user>
	<@bootstrap_usercard.user_card user=user/>
</#list>


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