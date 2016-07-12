<#import "/template/bootstrap.ftl" as bootstrap>
<html style="position:relative;min-height:100%;">
<@bootstrap.head title="个人资料"></@bootstrap.head>
<@bootstrap.body>
<div class="container" style="padding-top:60px">
  <#assign hasFieldErrors = fieldErrors??/>
  <#if hasFieldErrors>
  <#list fieldErrors?values as error>
  <div class="alert alert-danger" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <strong>Error:</strong>${error}
  </div>
  </#list>
  </#if>
  <div class="col-lg-3 col-md-3 col-sm-3" style="padding-left:0px">
    <div class="panel panel-default">
      <!-- Default panel contents -->
      <div class="panel-heading">Personal settings</div>
      <ul class="list-group">
        <a href="<@s.url action="profile"/>" class="list-group-item active">Profile</a>
        <a href="<@s.url action="account"/>" class="list-group-item">Account</a>
        <a href="<@s.url action="style"/>" class="list-group-item">Style</a>
      </ul>
    </div>
  </div>
  <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title">Profile</h3>
      </div>
      <div class="panel-body" id="profilePanelBody">
        <form action="<@s.url action="profile"/>">
          <div class="form-group">
            <label for="profileAvatar">Avatar</label><br/>
            <img src="${user.getAvatar()}" height="70" width="70" alt="加载中" style="margin-bottom:5;"/>
            <a href="#" class="btn btn-default">Upload avatar</a>
            <input type="hidden" id="profileAvatar" name="avatar" value="${user.getAvatar()}"/>
            <span id="helpBlock" class="help-block">Your avatar will be updated only after you click update button at the bottom of this panel.</span>
          </div>
          <div class="form-group">
            <label for="profileNickname">Nickname</label>
            <input type="text" class="form-control" name="nickname" id="profileNickname" value="${user.getNickname()}" required>
          </div>
          <div class="form-group">
            <label for="profileEmail">Email</label>
            <input type="email" class="form-control" name="email" id="profileEmail" <#if user.getEmail()??>value="${user.getEmail()}"</#if>>
          </div>
          <div class="form-group">
            <label for="profilePhoneNumber">Phone number</label>
            <input type="text" class="form-control" name="phoneNumber" id="profilePhoneNumber" <#if user.getPhoneNumber()??>value="${user.getPhoneNumber()}"</#if>>
          </div>
          <div class="form-group">
            <label for="profileBio">Bio</label>
            <textarea class="form-control" name="bio" id="profileBio" rows="3" style="resize:none;"><#if user.getBio()??>${user.getBio()}</#if></textarea>
          </div>
          <button type="submit" class="btn btn-success">Update profile</button>
        </form>
        <form id="profile-pic-upload" method="post" enctype="multipart/form-data" style="display: none;">
          <input type="file" name="upload" />
        </form>
      </div>
    </div>
  </div>
</div>
</@bootstrap.body>
<@bootstrap.javascript>
$("#profile-pic-upload input[name='upload']").change(function(){
  $("#profilePanelBody form div a").addClass("disabled");
  $("#profilePanelBody form div a").text("Uploading...");
  var fd = new FormData();
  fd.append("upload",$("#profile-pic-upload input[name='upload']")[0].files[0]);
  $.ajax({
    url: "<@s.url namespace="/api" action="pic-upload"/>",
    headers: headers,
    type: 'POST',
    data: fd,
    contentType:false,
    processData:false
  }).done(function(result){
    $("#profileAvatar").attr("value",result.url);
    $("#profilePanelBody form div img").attr("src",result.url);
    $("#profilePanelBody form div a").removeClass("disabled");
    $("#profilePanelBody form div a").text("Upload avatar");
  });
});
$("#profilePanelBody form div a").click(function(){
  $("#profile-pic-upload input").click();
});

</@bootstrap.javascript>
</html>
