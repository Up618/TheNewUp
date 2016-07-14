<#import "../template/bootstrap.ftl" as bootstrap>
<#import "../template/weibo.ftl" as bootstrap_weibo>
<#list weibos as weibo>
	<@bootstrap_weibo.weibo_card weibo=weibo>

		${weibo.getWeibo().getContent()}
</@bootstrap_weibo.weibo_card>
</#list>
<@bootstrap_weibo.weibo_comment_card_js>
</@bootstrap_weibo.weibo_comment_card_js>

<@bootstrap_weibo.weibo_pictures_js/>

<script type="text/javascript">
	$(document).ready(function () {
		var prebt =	document.getElementById("previousBtn");
		var nexbt = document.getElementById("nextBtn");
		if(${page} == 1 &&${weibos.size()}<10){
		$("#previousBtn").hide();
		$("#nextBtn").hide();
		}else{
			if(${page} > 1){
				prebt.disabled = false;
			}else{
				prebt.disabled=true;		}
			if(${weibos.size()}<10){
				nexbt.disabled = true;
			}else{
				nexbt.disabled = false;
			}
		}
	});

</script>
