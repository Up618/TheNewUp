<#import "/template/bootstrap.ftl" as bootstrap>
<#list weibos as weibo>
	<@bootstrap.weibo_card weibo=weibo>
	${weibo.getWeibo().getContent()}
	</@bootstrap.weibo_card>
</#list>