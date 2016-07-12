<#import "/template/bootstrap.ftl" as bootstrap>
<#import "../template/weibo.ftl" as bootstrap_weibo>
<#import "../template/usercard.ftl" as bootstrap_usercard>
<html style="position:relative;min-height:100%;">
<@bootstrap.head title="个人首页"></@bootstrap.head>
<@bootstrap.body>

<@bootstrap_weibo.weibo_comment/>

<div class="modal fade" id="imgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <img id="modelImg" src="">
    </div>
  </div>
</div>

<div class="container" style="padding-top:60px">
  <div class="row">
    <@bootstrap_usercard.user_card_lg user=user />
  </div>
<div class="col-sm-4 col-md-3 col-lg-3 col-md-offset-1 col-lg-offset-1" style="padding-left:0px">
  <@bootstrap.user_sidebar user=user.getUser()/>
</div>
<div id="user-weibo-column" class="col-sm-8 col-md-7 col-lg-7" data-bind="html: weibos" style="padding-right: 0px">

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
    makeAnnotationAvailable();
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
        makeAnnotationAvailable();
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
        makeAnnotationAvailable();
      });
    });
  }
}
ko.applyBindings(new weiboColumn(),document.getElementById("user-weibo-column"));
</@bootstrap.javascript>
</html>
