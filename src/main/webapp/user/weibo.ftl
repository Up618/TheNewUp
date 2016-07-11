<#import "../template/bootstrap.ftl" as bootstrap>
<#import "../template/weibo.ftl" as bootstrap_weibo>
<#list weibos as weibo>
	<@bootstrap_weibo.weibo_card weibo=weibo>
	${weibo.getWeibo().getContent()}
	</@bootstrap_weibo.weibo_card>
</#list>
<@bootstrap_weibo.weibo_card_js>
</@bootstrap_weibo.weibo_card_js>