<#import "/template/bootstrap.ftl" as bootstrap>
<html style="position:relative;min-height:100%;">
<@bootstrap.head title="这是首页"></@bootstrap.head>
<@bootstrap.body>
<div class="container" style="padding-top:60px">
    <div class="col-lg-3 col-md-3 col-sm-3">
        <@bootstrap.user_sidebar user=user>
	    <a href="<@s.url namespace="/user" action="${user.getId()}" />"><img src="${user.getAvatar()}" alt="头像"></a>
	</@bootstrap.user_sidebar>
    </div>
</div>
    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
    </div>
</div>
</@bootstrap.body>
</html>
