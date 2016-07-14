<#import "/template/bootstrap.ftl" as bootstrap>
<#import "../template/weibo.ftl" as bootstrap_weibo>
<#import "../template/usercard.ftl" as bootstrap_usercard>
<html style="position:relative;min-height:100%;">
<@bootstrap.head title="个人首页"></@bootstrap.head>
<@bootstrap.body>
<@bootstrap_weibo.weibo_comment/>
<@bootstrap_weibo.weibo_comment_submit_js/>


<div class="modal fade bs-example-modal-lg" id="imgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <img id="modelImg" src="" width="600px">
    </div>

    <a class="left" href="javascript:lastImg()"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span></a>
    <a class="right" href="javascript:nextImg()"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></a>
</div>

<div class="container" style="padding-top:60px">
  <@bootstrap_usercard.user_card_lg user=user />
  <div class="col-sm-4 col-md-3 col-lg-3 col-md-offset-1 col-lg-offset-1" style="padding-left:0px">
    <@bootstrap.user_sidebar user=user.getUser()/>
  </div>
  <script>
  	$(document).ready(function () {
      $("#weibos-btn").removeClass().addClass("upSidebar-active");
    });
  </script>
  <div id="user-weibo-column" class="col-sm-8 col-md-7 col-lg-7" data-bind="html: weibos" style="padding-right: 0px">

  </div>
  <@bootstrap_weibo.weibo_pictures_js/>
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
    $(".comment_show").click(function(){
    $("#up-comment").modal();
    var wc = $(this).first().parent().parent().parent().parent().children(".up-body").html();
    var wid_comment = $(this).attr("id");
    $("#wc").text(wc);
    document.getElementById("wid_comment").value = wid_comment;
    
    });

    comment_input_js();
  });
  function applyNew(){
    makeAnnotationAvailable(".up-body");
    $(".nextable").click(function(){
      userWeiboPage++;
      $.ajax({
        data: {page:userWeiboPage},
        url: "${user.getUser().getId()}/weibo",
      }).done(function(data){
        self.weibos(data);
        applyNew();
        
        $(".comment_show").click(function(){
        $("#up-comment").modal();
        var wc = $(this).first().parent().parent().parent().parent().children(".up-body").html();
        var wid_comment = $(this).attr("id");
        $("#wc").text(wc);
        document.getElementById("wid_comment").value = wid_comment;
    
    });

    comment_input_js();
    
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
        
        $(".comment_show").click(function(){
        $("#up-comment").modal();
        var wc = $(this).first().parent().parent().parent().parent().children(".up-body").html();
        var wid_comment = $(this).attr("id");
        $("#wc").text(wc);
        document.getElementById("wid_comment").value = wid_comment;
    
    });

    comment_input_js();
      });
    });
  }
}
ko.applyBindings(new weiboColumn(),document.getElementById("user-weibo-column"));
</@bootstrap.javascript>
</html>
