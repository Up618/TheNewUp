<#import "/template/bootstrap.ftl" as bootstrap>
<html style="position:relative;min-height:100%;">
<@bootstrap.head title="账户设置"></@bootstrap.head>
<@bootstrap.body>
<div class="container" style="padding-top:60px">
  <div class="col-lg-3 col-md-3 col-sm-3" style="padding-left:0px">
    <div class="panel panel-default">
      <!-- Default panel contents -->
      <div class="panel-heading">Personal settings</div>
      <ul class="list-group">
        <a href="<@s.url action="profile"/>" class="list-group-item">Profile</a>
        <a href="<@s.url action="account"/>" class="list-group-item">Account</a>
        <a href="<@s.url action="style"/>" class="list-group-item active">Style</a>
      </ul>
    </div>
  </div>
</div>
</@bootstrap.body>
<@bootstrap.javascript/>
</html>