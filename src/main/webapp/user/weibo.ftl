<#import "../template/bootstrap.ftl" as bootstrap>
<#import "../template/weibo.ftl" as bootstrap_weibo>
<#list weibos as weibo>
	<@bootstrap_weibo.weibo_card weibo=weibo>

		${weibo.getWeibo().getContent()}
</@bootstrap_weibo.weibo_card>

<@bootstrap_weibo.weibo_comment_card_js>
</@bootstrap_weibo.weibo_comment_card_js>
</#list>


<nav>
  <ul id="weibo-pager" class="pager">
  	<#if page == 1>
    	<li class="previous disabled"><a href="#"><span aria-hidden="true">&larr;</span> Previous</a></li>
    <#else>
    	<li class="previous"><a href="#" class="previousable"><span aria-hidden="true">&larr;</span> Previous</a></li>
    </#if>
	<#if weibos.size() < 10>
    	<li class="next disabled"><a href="#">Next <span aria-hidden="true">&rarr;</span></a></li>
    <#else>
    	<li class="next"><a href="#" class="nextable">Next <span aria-hidden="true">&rarr;</span></a></li>
	</#if>
  </ul>
</nav>
