<#import "/template/bootstrap.ftl" as bootstrap>
<html style="position:relative;min-height:100%;">
<@bootstrap.head title="个人首页"></@bootstrap.head>
<@bootstrap.body>

<div class="modal fade" id="imgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <img id="modelImg" src="">
    </div>
  </div>
</div>

<div class="container" style="padding-top:60px">
  <div class="row">
    <@bootstrap.user_card_lg user=user />
  </div>

  <div class="row">
    <div class="col-md-3 col-sm-3 col-lg-3">
      <@bootstrap.user_sidebar user=user.getUser()/>

    </div>
    <div id="user-weibo-column" class="col-md-9 col-sm-9 col-lg-9" data-bind="html: weibos">

    </div>
  </div>
</div>
</@bootstrap.body>
<@bootstrap.javascript>
function weiboColumn(){
  var self = this;
  var userWeiboPage = 1;
  self.weibos = ko.observable();
  $.ajax({
    url: "${user.getUser().getId()}/weibo",
  }).done(function(data){
    self.weibos(data);
    applyNew();
  });
  function applyNew(){
    $(".nextable").click(function(){
      userWeiboPage++;
      $.ajax({
        data: {page:userWeiboPage},
        url: "${user.getUser().getId()}/weibo",
      }).done(function(data){
        self.weibos(data);
        applyNew();
      });
    });
    $(".previousable").click(function(){
      userWeiboPage--;
      $.ajax({
        data: {page:userWeiboPage},
        url: "${user.getUser().getId()}/weibo",
      }).done(function(data){
        self.weibos(data);
        applyNew();
      });
    });
  }
}
ko.applyBindings(new weiboColumn(),document.getElementById("user-weibo-column"));
</@bootstrap.javascript>
</html>
