<#import "/template/bootstrap.ftl" as bootstrap>
<html style="position:relative;min-height:100%;">
<@bootstrap.head title="这是首页"></@bootstrap.head>
<@bootstrap.body>
<div class="container" style="padding-top:60px">

  <div class="col-lg-3 col-md-3 col-sm-3" style="padding-left:0px">
    <div class="thumbnail">
      <div class="caption">
        <a href="<@s.url namespace="/user" action="${user.getId()}" />">
        <img src="${user.getAvatar()}" alt="头像">
      </a>
      <a class="upSidebar" href="<@s.url namespace="/user" action="${user.getId()}" />">
      <li class="list-group-item">
        <span class="badge">${user.getWeiboAmount()}</span>
        Weibos
      </li>
    </a>

    <a class="upSidebar" href="<@s.url action="${user.getId()}-get-follow" />">
    <li class="list-group-item">
      <span class="badge">${user.getFollowAmount()}</span>
      关注
    </li>
  </a>

  <a class="upSidebar" href="<@s.url action="${user.getId()}-get-fans" />">
  <li class="list-group-item">
    <span class="badge">${user.getFansAmount()}</span>
    粉丝
  </li>
</a>
</div>
</div>
  <div class="thumbnail">
  <div class="caption">
  <a class="upSidebar" href="<@s.url namespace="/agree" action="${user.getId()}-liked-weibo" />">
  <li class="list-group-item">
  <span class="badge">${user.getLikedWeiboAmount()}</span>
	我赞过的微博
  </li>
  </a>
  </div>
  </div>
</div>
<div id="index-weibo-column" class="col-lg-9 col-md-9 col-sm-9 col-xs-12" data-bind="html: weibos">
	
</div>
</div>
</@bootstrap.body>
<@bootstrap.javascript>
function weiboColumn(){
  var self = this;
  var userWeiboPage = 1;
  self.weibos = ko.observable();
  $.ajax({
  	data: {page:userWeiboPage},
    url: "<@s.url action="index" namespace="/weibo"/>",
  }).done(function(data){
    self.weibos(data);
    applyNew();
  });
  function applyNew(){
    makeAnnotationAvailable(".up-body");
    $(".nextable").click(function(){
      userWeiboPage++;
      $.ajax({
        data: {page:userWeiboPage},
        url: "<@s.url action="index" namespace="/weibo"/>",
      }).done(function(data){
        self.weibos(data);
        applyNew();
      });
    });
    $(".previousable").click(function(){
      userWeiboPage--;
      $.ajax({
        data: {page:userWeiboPage},
        url: "<@s.url action="index" namespace="/weibo"/>",
      }).done(function(data){
        self.weibos(data);
        applyNew();
      });
    });
  }
}
ko.applyBindings(new weiboColumn(),document.getElementById("index-weibo-column"));
</@bootstrap.javascript>
</html>
