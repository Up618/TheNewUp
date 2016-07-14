<#import "/template/bootstrap.ftl" as bootstrap>
<#import "../template/usercard.ftl" as bootstrap_usercard>
<html style="position:relative;min-height:100%;">
<@bootstrap.head title="查看用户"></@bootstrap.head>
<@bootstrap.body>

<div class="container" style="padding-top:70px">
	<div class="row">
		<div class="col-sm-9 col-sm-offset-2 col-md-8 col-md-offset-3 col-lg-7 col-lg-offset-4">
			<div class="list-group">
				<#list weibos as weibo>
					<div class="row" style = "margin-bottom:20px">
    					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
        					<a href="<@s.url namespace="/user" action="${weibo.getUser().getId()}" />">
            					<img class="img-thumbnail" src="${weibo.getUser().getAvatar()}" alt="头像" width="70" height = "70">
        					</a>
    					</div>
    				<div class="col-lg-9 col-md-9 col-sm-8 col-xs-8">
    				
        	<div class="up-content" style="height: auto">
            <p class="up-sign-nickname">
                    ${weibo.getUser().getUsername()} : ${weibo.getContent()}
            </p>
            <p class="up-time">${weibo.getTime()}</p>
        </div>
        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
        <form id="in" action="../admin/deleteWeibo" method="post">
            <input type="hidden"  name="weibo_id" value="${weibo.getId()}"/>
                <div style="text-align: right">
                    <button type="submit" class="btn btn-primary" style="margin-top: 10px">删除微博</button>
                 </div>
           <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        </div> 
    </div>
</div>
</#list>




			</div>
		</div>
	</div>
</div>
</@bootstrap.body>
<@bootstrap.javascript/>
</html>




