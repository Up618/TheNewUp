<#import "/template/bootstrap.ftl" as bootstrap>
<html style="position:relative;min-height:100%;">
<@bootstrap.head title="账户设置"></@bootstrap.head>
<@bootstrap.body>
<div class="container" style="padding-top:60px">
  <@bootstrap.errorInfo/>
  <div class="col-lg-3 col-md-3 col-sm-3" style="padding-left:0px">
    <div class="panel panel-default">
      <!-- Default panel contents -->
      <div class="panel-heading">个人设置</div>
      <ul class="list-group">
        <a href="<@s.url action="profile"/>" class="list-group-item">个人资料</a>
        <a href="<@s.url action="account"/>" class="list-group-item active">账户资料</a>
      </ul>
    </div>
  </div>
  <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title">账户设置</h3>
      </div>
      <div class="panel-body">
        <form action="<@s.url action="account"/>">
        <div class="form-group">
          <label for="accountOldPassword">原密码</label>
          <input type="password" class="form-control" name="oldPassword" id="accountOldPassword" required>
        </div>
        <div class="form-group">
          <label for="accountNewPassword">新密码</label>
          <input type="password" class="form-control" name="password" id="accountNewPassword" required>
        </div>
        <div class="form-group">
          <label for="accountNewPasswordAgain">请再次输入新密码</label>
          <input type="password" class="form-control" name="passwordAgain" id="accountNewPasswordAgain" required>
        </div>
        <button type="submit" class="btn btn-success">保存密码修改</button>
      </form>
    </div>
  </div>
</div>
</div>
</@bootstrap.body>
<@bootstrap.javascript/>
</html>
