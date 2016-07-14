<#import "/template/bootstrap.ftl" as bootstrap>
<html style="position:relative;min-height:100%;">
<@bootstrap.head title="管理员首页"></@bootstrap.head>
<@bootstrap.body>
<div class="container" style="padding-top:60px">

  <div class="col-lg-3 col-md-3 col-sm-3" style="padding-left:0px">
    <div class="thumbnail">
      <div class="caption">
      <a href="<@s.url namespace="/user" action="${user.getId()}" />">
        <img src="${user.getAvatar()}" alt="头像">
      </a>
      <h class="upSidebar">
      <li class="list-group-item">
        	${user.getUsername()}
      </li>
    </h>
    <a class="upSidebar" href="<@s.url action="viewWeibo" />">
      <li class="list-group-item">查看所有微博</li>
    </a>

    <a class="upSidebar" href="<@s.url action="view-user" />">
    	<li class="list-group-item">查看所有用户</li>
    </a>
</div>
</div>
</div>

<div id="index-weibo-column" class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
	
</div>
</div>
</@bootstrap.body>
</html>
