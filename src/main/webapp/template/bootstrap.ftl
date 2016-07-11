<#macro head title>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <meta name="description" content="">
  <meta name="author" content="">
  <#if _csrf??>
  <meta name="_csrf" content="${_csrf.token}"/>
  <!-- default header name is X-CSRF-TOKEN -->
  <meta name="_csrf_header" content="${_csrf.headerName}"/>
  </#if>

  <title>${title}</title>
  <link href="https://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" rel="stylesheet">
  <!-- Latest compiled and minified CSS -->
  <link href="http://139.129.48.155:8081/up.css" rel="stylesheet">
  <link href="https://cdn.bootcss.com/jasny-bootstrap/3.1.3/css/jasny-bootstrap.min.css" rel="stylesheet">
  <style type="text/css">

  .fa-weibo-pic > li{
    float: left;
  }
  .fa-weibo-pic > li.no-pic-li > a{
    padding:3;
  }
  .fa-weibo-pic > li.has-pic-li > a{
    position: absolute;
    padding: 3;
    height: 86;
    width: 86;
  }
  li.has-pic-li > a:hover{
    background-image: -webkit-gradient(linear,left top,left bottom,from(rgba(221,221,221,0.75)),to(rgba(221,221,221,0.75)));
    background-color: rgba(232, 232, 232, 0);
  }
  li.has-pic-li > a > span{
    display: none;
    padding: 33 32 33 34;
  }
  .fa-weibo-pic > li > a > img{
    height: 80;
    width: 80;
  }
  li.no-pic-li > a > span{
    padding:30 29 30 31;
    border-style: dashed;
    border-color: darkgray;
    color: darkgray;
  }
  .fa-weibo-pic > li > img{
    padding: 3;
    height: 86;
    width: 86;
  }

  body.modal-open[style="margin-bottom: 60px; padding-right: 17px;"] > footer,
  body.modal-open[style="margin-bottom: 60px; padding-right: 17px;"] > nav.navbar-fixed-top{
    padding-right: 17;
  }
  </style>
  <link href="http://o9x8azwl1.bkt.clouddn.com/newup.css" rel="stylesheet">
  <#nested>
  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
  <!-- Latest compiled and minified JavaScript -->
  <script src="https://cdn.bootcss.com/jasny-bootstrap/3.1.3/js/jasny-bootstrap.js"></script>
  <script src="https://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <script src="https://cdn.bootcss.com/knockout/3.4.0/knockout-min.js"></script>
  <script src="https://cdn.bootcss.com/vue/1.0.26/vue.min.js"></script>
</head>
</#macro>

<#macro body>
<body style="margin-bottom:60px;">
  <nav id="nav" class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="<@s.url namespace="/" action="index" />">UP</a>
      </div>
      <div id="navbar" class="collapse navbar-collapse">
        <form id="search" class="navbar-form navbar-left" role="search" action="<@s.url namespace="/search" action="user" />">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search" name="keyword">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
          <span class="glyphicon glyphicon-bell" aria-hidden="true"></span><span class="caret"></span>
        </a>
      </li>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><img data-bind="attr: { src: avatar, height: '20', width: '20' }, text: nickname "><span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Action</a></li>
          <li><a href="#">Another action</a></li>
          <li><a href="#">Something else here</a></li>
          <li role="separator" class="divider"></li>
          <li><a href="#" data-bind="click: signOut">Sign out</a></li>
        </ul>
      </li>
      <li><a href="#" data-toggle="modal" data-target=".bs-example-modal-lg"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a></li>
    </ul>
  </div>
</div>
</nav>
<#nested>
<form id="sign-out" method="post" action="<@s.url namespace="/" action="logout"/>" style="display: none;">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
<input type="submit" value="Sign out"/>
</form>
<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Up a new Up!</h4>
      </div>
      <form action="<@s.url namespace="/weibo" action="new" />" method="POST">
      <div class="modal-body">
        <textarea name="content" class="form-control" rows="20" style="resize:none;" required></textarea>
      </div>
      <div class="row" style="padding-left:15;padding-right:15;">
        <div class="col-md-8 col-sm-8 col-xs-8">
          <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">图片  <span class="caret"></span></button>
          <ul class="dropdown-menu fa-weibo-pic" style="margin-left:15;padding-left:12;padding-right:12;">
            <h5 style="padding-left:3;">上传图片</h5>
            <li class="no-pic-li"><a href="#">
              <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
            </a></li>
          </ul>
        </ul>
      </div>
      <div class="col-md-4 col-sm-4 col-xs-4" style="text-align:right;">
        <button type="submit" class="btn btn-primary">UP!</button>
      </div>
    </div>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
  </form>
</div>
</div>
</div>
<form id="pic-upload" method="post" enctype="multipart/form-data" style="display: none;">
  <input type="file" name="upload" />
</form>
<footer style="height:60px;position:absolute;bottom:0;width:100%;background-color:#2a2730">
  <div class="container" style="padding-right:15px;padding-left:15px;margin-top:10px">
    <p style="color:Ivory;text-align:center">Copyright &copy; 2016.UP All rights reserved.</p>
  </div>
</footer>
</body>
</#macro>

<#macro javascript>
<script type="text/javascript">
function ViewModel(){
  var self = this;
  self.avatar = ko.observable();
  self.nickname = ko.observable();
  self.myId = ko.observable();
  self.username = ko.observable();
  self.weiboAmount = ko.observable();
  self.fansAmount = ko.observable();
  self.followAmount = ko.observable();
  self.weibos = ko.observable();
  $.ajax({
    type: 'GET',
    url: "<@s.url namespace="/api" action="user" />",
  }).done(function (data) {
    self.avatar(data.user.user.avatar);
    self.nickname(data.user.user.nickname);
    self.myId(data.user.user.id);
    self.username(data.user.user.username);
    self.weiboAmount(data.user.user.weiboAmount);
    self.fansAmount(data.user.user.fansAmount);
    self.followAmount(data.user.user.followAmount);
  });
  self.signOut = function(){
    $("#sign-out").submit();
  };

}
$(function() {
  // Handler for .ready() called.
  var app = new ViewModel();
  ko.applyBindings(app,document.getElementById("nav"));

  var token = $("meta[name='_csrf']").attr("content");
  var header = $("meta[name='_csrf_header']").attr("content");
  var headers = {};
  headers[header] = token;
  $("input[name='upload']").change(function(){
    $("<li class=\"has-pic-li\"><a href=\"#\"><span class=\"glyphicon glyphicon-remove\" aria-hidden=\"true\"></span></a><img src=\"\" alt=\"加载中\" /></li>").insertBefore($("li.no-pic-li"));
    var fd = new FormData();
    fd.append("upload",$("input[name='upload']")[0].files[0]);
    $.ajax({
      url: "<@s.url namespace="/api" action="pic-upload"/>",
      headers: headers,
      type: 'POST',
      data: fd,
      contentType:false,
      processData:false
    }).done(function(result){
      $("li.has-pic-li:last img").attr("src",result.url);
      $("li.has-pic-li").click(function(e){
        $("input[value=\""+$(this).children("img").attr("src")+"\"]").remove();
        $(this).remove();
        e.stopPropagation();
      });
      $("li.has-pic-li").hover(
        function() {
          $( this ).find("span").css("display","inherit");
        }, function() {
          $( this ).find( "span" ).hide();
        }
      );
      $("form[action='<@s.url namespace="/weibo" action="new" />']").append(
        "<input type=\"hidden\" name=\"urls\" value=\""+result.url+"\" />"
      )
    }).fail(function(err){
      console.log(err);
    });
  });
  $("input[name='upload']").click(function(e){
    e.stopPropagation();
  });
  $("li.no-pic-li").click(function(e){
    $("input[name='upload']").click();
    e.stopPropagation();
  });
  <#nested>
});
</script>
</#macro>

<#macro modal title>
<div class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">${title}</h4>
      </div>
      <div class="modal-body">
        <#nested>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</#macro>

<#macro weibo_card weibo>
<div class="row" style = "margin-bottom:20px">
  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
    <a href="<@s.url namespace="/user" action="${weibo.getWeibo().getUser().getId()}" />">
    <img class="img-thumbnail" src="${weibo.getWeibo().getUser().getAvatar()}" alt="头像" width="60">
  </div>
  <div class="row up-operat">
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
      <p align="center" class="up-operate"><a><span class="glyphicon glyphicon-share" aria-hidden="true"></span> 转发</a></p>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
      <p align="center" class="up-operate"><a id="${weibo.getWeibo().getId()}comment" data-toggle="modal" data-target="#${weibo.getWeibo().getId()}up-comment"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span> 评论</a></p>
    </div>

    <!-----------------------------------评论的获取函数---------------------------------->
    <script type="text/javascript">
    $(document).ready(function () {
      $("#${weibo.getWeibo().getId()}comment").click(function(){
        var self = this;
        self.avatar = ko.observable();
        self.nickname = ko.observable();
        self.time = ko.observable();
        self.content = ko.observable("");
        $.ajax({
          type: 'GET',
          url: "<@s.url namespace="/comment" action="comment"><@s.param name="weibo_id" value="${weibo.getWeibo().getId()}"/> </@s.url>",
        }).done(function (data) {
          //======================下面是第1条评论的内容===============================
          if(data.nickname!=null){
            $("#${weibo.getWeibo().getId()}comment_name").text(data.nickname+"：");
            $("#${weibo.getWeibo().getId()}comment_agree").show();
          }
          if(data.content!=null){
            $("#${weibo.getWeibo().getId()}comment_content").text(data.content);
          }
          if(data.time){
            $("#${weibo.getWeibo().getId()}comment_time").text(data.time);
          }
          if(data.avatar!=null){
            document.getElementById("${weibo.getWeibo().getId()}comment_img").src=data.avatar;
          }

          //======================下面是第2条评论的内容===============================
          if(data.nickname2!=null){
            $("#${weibo.getWeibo().getId()}comment_name2").text(data.nickname2+"：");
            $("#${weibo.getWeibo().getId()}comment_agree2").show();
          }
          if(data.content2!=null){
            $("#${weibo.getWeibo().getId()}comment_content2").text(data.content2);
          }
          if(data.time2){
            $("#${weibo.getWeibo().getId()}comment_time2").text(data.time2);
          }
          if(data.avatar2!=null){
            document.getElementById("${weibo.getWeibo().getId()}comment_img2").src=data.avatar2;
          }

          //======================下面是第3条评论的内容===============================
          if(data.nickname3!=null){
            $("#${weibo.getWeibo().getId()}comment_name3").text(data.nickname3+"：");
            $("#${weibo.getWeibo().getId()}comment_agree3").show();
          }
          if(data.content3!=null){
            $("#${weibo.getWeibo().getId()}comment_content3").text(data.content3);
          }
          if(data.time3){
            $("#${weibo.getWeibo().getId()}comment_time3").text(data.time3);
          }
          if(data.avatar3!=null){
            document.getElementById("${weibo.getWeibo().getId()}comment_img3").src=data.avatar3;
          }
          self.nickname(data.nickname);
          self.content(data.content);
          self.time(data.time);
          self.avatar(data.avatar);
        }) //done
      }); //click
    }); //document.ready
    </script>
    <!-----------------------------------上面为评论的获取函数---------------------------->

    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
      <p align="center" class="up-operate">
        <a id="${weibo.getWeibo().getId()}agree" href="#${weibo.getWeibo().getId()}">
          <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
          点赞
          <b>${weibo.getWeibo().getAgreeAmount()}</b>
        </a>
      </p>
    </div>
  </div>
  <script>

  $(document).ready(function () {
    $("#${weibo.getWeibo().getId()}agree").click(function(){
      var token = $("meta[name='_csrf']").attr("content"); //之前已经把对应的变量存入<head>的<meta>中
      var header = $("meta[name='_csrf_header']").attr("content");
      var headers = {};
      headers[header] = token;
      $.ajax({
        type: 'POST',
        dataType:'json',
        headers: headers,
        url: "<@s.url namespace="/agree" action="agree"><@s.param name="weibo_id" value="${weibo.getWeibo().getId()}"/> </@s.url>",
        //传一个微博id的param到后台
      }).done(function (data) {
        //alert(data.ifLiked);
        //判断按钮样式
        if (!data.ifLiked) {
          $("#${weibo.getWeibo().getId()}agree b").text(parseInt($("#${weibo.getWeibo().getId()}agree b").text()) + 1);
          agree${weibo.getWeibo().getId()} = true;
          $("#${weibo.getWeibo().getId()}agree").css("color", "red");
          $("#${weibo.getWeibo().getId()}agree").mouseover(function () {
            $("#${weibo.getWeibo().getId()}agree").css("color", "black");
          });
          $("#${weibo.getWeibo().getId()}agree").mouseout(function () {
            $("#${weibo.getWeibo().getId()}agree").css("color", "red");
          });
        }//if
        else {
          $("#${weibo.getWeibo().getId()}agree b").text(parseInt($("#${weibo.getWeibo().getId()}agree b").text()) - 1);
          agree${weibo.getWeibo().getId()} = false;
          $("#${weibo.getWeibo().getId()}agree").css("color", "black");
          $("#${weibo.getWeibo().getId()}agree").mouseover(function () {
            $("#${weibo.getWeibo().getId()}agree").css("color", "red");
          });
          $("#${weibo.getWeibo().getId()}agree").mouseout(function () {
            $("#${weibo.getWeibo().getId()}agree").css("color", "black");
          });
        }//else
      }) //done
    }); //click
  }); //document.ready

  </script>
</div>
</div>
</div>
<div class="modal fade" id="${weibo.getWeibo().getId()}up-comment" tabindex="-1" role="dialog" aria-labelledby="${weibo.getWeibo().getId()}comment-title" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close"data-dismiss="modal" aria-hidden="true">
          &times;
        </button>
        <p class="comment-title"></p>
      </div>
      <div class="modal-body">
        <div class="row" style="margin-left: 0px; margin-right: 0px;">
          <p>${weibo.getWeibo().getContent()}</p>
          <form id="in" action="../comment/inputComment" method="post">
            <input type="hidden"  name="weibo_id" value="${weibo.getWeibo().getId()}"/>
            <textarea name="content" class="form-control" rows="2" style="resize:none;"
            placeholder="评论......" required></textarea>
            <div style="text-align: right">
              <button type="submit" class="btn btn-primary" style="margin-top: 10px">评论</button>
            </div>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
          </form>
          <@bootstrap.comment_model weibo>
          </@bootstrap.comment_model>
          <div>
            <div class="row">
              <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" style="text-align: center">
                <a href="<@s.url namespace="/user" action="${weibo.getWeibo().getUser().getId()}" />">
                <img id="${weibo.getWeibo().getId()}comment_img", text: nickname", width = "40", heighth = "40">
              </a>
            </div>
            <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 row">
              <p>
                <h id="${weibo.getWeibo().getId()}comment_name"></h>
                <!--评论人名称-->
                <h id="${weibo.getWeibo().getId()}comment_content"></h>
                <!--评论人名称-->
              </p>
              <p id="${weibo.getWeibo().getId()}comment_time" class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
              </p><!--评论时间-->
              <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 comment-agree" style="text-align: right">
                <a id="${weibo.getWeibo().getId()}comment_agree" style="display:none" class="btn btn-default btn-xs" href="javascript:agreethecomment${weibo.getId()}()"><span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span><b>1</b></a>
              </div>
            </div>
          </div>


          <!------------------------------下面是第二条评论--------------------------------------------->
          <div class="row">
            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" style="text-align: center">
              <a href="<@s.url namespace="/user" action="${weibo.getWeibo().getUser().getId()}" />">
              <img id="${weibo.getWeibo().getId()}comment_img2", text: nickname2", width = "40", heighth = "40">
            </a>
          </div>
          <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 row">
            <p>
              <h id="${weibo.getWeibo().getId()}comment_name2"></h>
              <!--评论人名称-->
              <h id="${weibo.getWeibo().getId()}comment_content2"></h>
              <!--评论人名称-->
            </p>
            <p id="${weibo.getWeibo().getId()}comment_time2" class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
            </p><!--评论时间-->
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 comment-agree" style="text-align: right">
              <a id="${weibo.getWeibo().getId()}comment_agree2" style="display:none" class="btn btn-default btn-xs" href="javascript:agreethecomment${weibo.getWeibo().getId()}()"><span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span><b>1</b></a>
            </div>
          </div>
        </div>
        <!------------------------------上面是第二条评论--------------------------------------------->


        <!------------------------------下面是第三条评论--------------------------------------------->
        <div class="row">
          <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" style="text-align: center">
            <a href="<@s.url namespace="/user" action="${weibo.getWeibo().getUser().getId()}" />">
            <img id="${weibo.getWeibo().getId()}comment_img3", text: nickname3", width = "40", heighth = "40">
          </a>
        </div>
        <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 row">
          <p>
            <h id="${weibo.getWeibo().getId()}comment_name3"></h>
            <!--评论人名称-->
            <h id="${weibo.getWeibo().getId()}comment_content3"></h>
            <!--评论人名称-->
          </p>
          <p id="${weibo.getWeibo().getId()}comment_time3" class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
          </p><!--评论时间-->
          <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 comment-agree" style="text-align: right">
            <a id="${weibo.getWeibo().getId()}comment_agree3" style="display:none" class="btn btn-default btn-xs" href="javascript:agreethecomment${weibo.getId()}()"><span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span><b>1</b></a>
          </div>
        </div>
      </div>
      <!------------------------------上面是第三条评论--------------------------------------------->


      <script>
        var comment_agree${weibo.getWeibo().getId()} = true;                 <!--把true改作是否点赞的布尔值-->
        $(document).ready(function () {
          if (!comment_agree${weibo.getWeibo().getId()}) {
            $("#${weibo.getWeibo().getId()}comment_agree").css("color", "black");
            $("#${weibo.getWeibo().getId()}comment_agree").mouseover(function () {
              $("#${weibo.getWeibo().getId()}comment_agree").css("color", "red");
            });
            $("#${weibo.getWeibo().getId()}comment_agree").mouseout(function () {
              $("#${weibo.getWeibo().getId()}comment_agree").css("color", "black");
            });
          }
          else {
            $("#${weibo.getWeibo().getId()}comment_agree").css("color", "red");
            $("#${weibo.getWeibo().getId()}comment_agree").mouseover(function () {
              $("#${weibo.getWeibo().getId()}comment_agree").css("color", "black");
            });
            $("#${weibo.getWeibo().getId()}comment_agree").mouseout(function () {
              $("#${weibo.getWeibo().getId()}comment_agree").css("color", "red");
            })
          }
        });
        function agreethecomment${weibo.getWeibo().getId()}() {
          if (!comment_agree${weibo.getWeibo().getId()}) {
            $("#${weibo.getWeibo().getId()}comment_agree b").text(parseInt($("#${weibo.getWeibo().getId()}comment_agree b").text()) + 1);
            comment_agree${weibo.getWeibo().getId()} = true;
            $("#${weibo.getWeibo().getId()}comment_agree").css("color", "red");
            $("#${weibo.getWeibo().getId()}comment_agree").mouseover(function () {
              $("#${weibo.getWeibo().getId()}comment_agree").css("color", "black");
            });
            $("#${weibo.getWeibo().getId()}comment_agree").mouseout(function () {
              $("#${weibo.getWeibo().getId()}comment_agree").css("color", "red");
            });
            //这个地方发评论点赞请求
          }
          else {
            $("#${weibo.getWeibo().getId()}comment_agree b").text(parseInt($("#${weibo.getWeibo().getId()}comment_agree b").text()) - 1);
            comment_agree${weibo.getWeibo().getId()} = false;
            $("#${weibo.getWeibo().getId()}comment_agree").css("color", "black");
            $("#${weibo.getWeibo().getId()}comment_agree").mouseover(function () {
              $("#${weibo.getWeibo().getId()}comment_agree").css("color", "red");
            });
            $("#${weibo.getWeibo().getId()}comment_agree").mouseout(function () {
              $("#${weibo.getWeibo().getId()}comment_agree").css("color", "black");
            });














          </div><!-- /.modal-content -->
        </div><!-- /.modal -->
      </div>
      </#macro>

      <#macro user_card_follow user>
      <div id="${user[0].getUsername()}card" class="list-group-item row">
        <div class="col-lg-2 col-md-2 col-sm-3 col-xs-4">
          <a href="<@s.url namespace="/user" action="${user[0].getId()}" />" class="thumbnail">
          <img class="img-responsive" src="${user[0].getAvatar()}" alt="头像">
        </a>
      </div>
      <div class="col-lg-8 col-md-8 col-sm-7 col-xs-8">
        <h3>${user[0].getNickname()}</h3>
        <p>关注数${user[0].getFollowAmount()}   粉丝数${user[0].getFansAmount()}   微博数<a href="<@s.url namespace="/user" action="${user[0].getId()}" />">${user[0].getWeiboAmount()}</a></p>
        <p>${user[0].getSignature()!" "}</p>
      </div>
      <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
        <button id="${user[0].getNickname()}followButton" class="btn btn-info"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span><b>关注</b></button>
      </div>
      <script type="text/javascript">
      var ${user[0].getNickname()}follow = ${user[1]};                        //这地方写是否关注
      $(document).ready(function () {

        if (${user[0].getNickname()}follow) {
          $("#${user[0].getNickname()}followButton").removeClass().addClass("btn btn-default");
          $("#${user[0].getNickname()}followButton span").removeClass().addClass("glyphicon glyphicon-retweet");
          $("#${user[0].getNickname()}followButton b").text("互相关注");
          $("#${user[0].getNickname()}followButton span").css("color","black");
          $("#${user[0].getNickname()}followButton b").css("color","black");
        }
        else {
          $("#${user[0].getNickname()}followButton").removeClass().addClass("btn btn-info");
          $("#${user[0].getNickname()}followButton span").removeClass().addClass("glyphicon glyphicon-ok");
          $("#${user[0].getNickname()}followButton b").text("已关注");
          $("#${user[0].getNickname()}followButton span").css("color","white");
          $("#${user[0].getNickname()}followButton b").css("color","white");
        }

        $("#${user[0].getNickname()}followButton").click(function () {
          var oMyForm = new FormData();
          oMyForm.append("followusername", "${user[0].getUsername()}");
          var token = $("meta[name='_csrf']").attr("content");
          var header = $("meta[name='_csrf_header']").attr("content");
          var headers = {};
          headers[header] = token;
          $.ajax({
            type:'POST',
            url:"<@s.url action="delete-follow"/>",
            data:oMyForm,
            headers: headers,
            dataType:'html',
            contentType:false,
            processData:false,
            error:function(){
              alert("发生了一些错误，请稍后再试！");
            },
            success:function(){


              $("#${user[0].getNickname()}followButton").removeClass().addClass("btn btn-info");
              $("#${user[0].getNickname()}followButton span").removeClass().addClass("glyphicon glyphicon-plus");
              $("#${user[0].getNickname()}followButton b").text("关注");
              $("#${user[0].getNickname()}followButton span").css("color","white");
              $("#${user[0].getNickname()}followButton b").css("color","white");

              alert(	"已取消关注");
              $("#${user[0].getUsername()}card").hide();
            }
          });

          //发送取消关注请求

        });
      });
      </script>
    </div>

    </#macro>



    <#macro user_card_fans user>
    <div class="list-group-item row">
      <div class="col-lg-2 col-md-2 col-sm-3 col-xs-4">
        <a href="<@s.url namespace="/user" action="${user[0].getId()}" />" class="thumbnail">
        <img class="img-responsive" src="${user[0].getAvatar()}" alt="头像">
      </a>
    </div>
    <div class="col-lg-8 col-md-8 col-sm-7 col-xs-8">
      <h3>${user[0].getNickname()}</h3>
      <p>关注数${user[0].getFollowAmount()}   粉丝数${user[0].getFansAmount()}   微博数<a href="<@s.url namespace="/user" action="${user[0].getId()}" />">${user[0].getWeiboAmount()}</a></p>
      <p>${user[0].getSignature()!" "}</p>
    </div>
    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
      <button id="${user[0].getNickname()}followButton" class="btn btn-info"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span><b>关注</b></button>
    </div>
    <script type="text/javascript">
    var ${user[0].getNickname()}follow = ${user[1]};                        //这地方写是否关注
    $(document).ready(function () {

      if (${user[0].getNickname()}follow) {
        $("#${user[0].getNickname()}followButton").removeClass().addClass("btn btn-default");
        $("#${user[0].getNickname()}followButton span").removeClass().addClass("glyphicon glyphicon-retweet");
        $("#${user[0].getNickname()}followButton b").text("互相关注");
        $("#${user[0].getNickname()}followButton span").css("color","black");
        $("#${user[0].getNickname()}followButton b").css("color","black");
      }
      else {
        $("#${user[0].getNickname()}followButton").removeClass().addClass("btn btn-info");
        $("#${user[0].getNickname()}followButton span").removeClass().addClass("glyphicon glyphicon-plus");
        $("#${user[0].getNickname()}followButton b").text("关注");
        $("#${user[0].getNickname()}followButton span").css("color","white");
        $("#${user[0].getNickname()}followButton b").css("color","white");
      }

      $("#${user[0].getNickname()}followButton").click(function () {
        if (${user[0].getNickname()}follow) {
          ${user[0].getNickname()}follow = false;
          var oMyForm = new FormData();
          oMyForm.append("followusername", "${user[0].getUsername()}");
          var token = $("meta[name='_csrf']").attr("content");
          var header = $("meta[name='_csrf_header']").attr("content");
          var headers = {};
          headers[header] = token;
          $.ajax({
            type:'POST',
            url:"<@s.url action="delete-follow"/>",
            data:oMyForm,
            headers: headers,
            dataType:'html',
            contentType:false,
            processData:false,
            error:function(){
              alert("发生了一些错误，请稍后再试！");
            },
            success:function(){


              $("#${user[0].getNickname()}followButton").removeClass().addClass("btn btn-info");
              $("#${user[0].getNickname()}followButton span").removeClass().addClass("glyphicon glyphicon-plus");
              $("#${user[0].getNickname()}followButton b").text("关注");
              $("#${user[0].getNickname()}followButton span").css("color","white");
              $("#${user[0].getNickname()}followButton b").css("color","white");

              alert(	"已取消关注");
            },
          });

          //发送取消关注请求
        }
        else {
          ${user[0].getNickname()}follow = true;
          var oMyForm = new FormData();
          oMyForm.append("followusername", "${user[0].getUsername()}");
          var token = $("meta[name='_csrf']").attr("content");
          var header = $("meta[name='_csrf_header']").attr("content");
          var headers = {};
          headers[header] = token;
          $.ajax({
            type:'POST',
            url:"<@s.url action="follow"/>",
            data:oMyForm,
            headers: headers,
            dataType:'html',
            contentType:false,
            processData:false,
            error:function(){
              alert("发生了一些错误，请稍后再试！");
            },
            success:function(){
              $("#${user[0].getNickname()}followButton").removeClass().addClass("btn btn-default");
              $("#${user[0].getNickname()}followButton span").removeClass().addClass("glyphicon glyphicon-ok");
              $("#${user[0].getNickname()}followButton b").text("已关注");
              $("#${user[0].getNickname()}followButton span").css("color","black");
              $("#${user[0].getNickname()}followButton b").css("color","black");

              alert(	"已成功关注");
            },
          });



          //发送关注请求
        }
      });
    });
    </script>
  </div>

  </#macro>

  <#macro user_card_lg user>
  <div style="text-align:center;">
    <div class="thumbnail userCard">
      <img class="img-thumbnail" src="${user.getUser().getAvatar()}" alt="头像" alt="头像" height="120" width="120">
      <h2>${user.getUser().getNickname()}</h2>
      <p>${user.getUser().getSignature()!" "}</p>
      <button id="followButton" class="btn btn-info"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span><b>关注</b></button>
    </div>
    <script type="text/javascript">
    var follow = false;                        //这地方写是否关注
    var following = ${user.getFollowing()?then('true','false')};
    var followed = ${user.getFollower()?then('true','false')};
    $(document).ready(function () {
      if (follow) {
        alert("zhaoweisohai");
        $("#followButton").removeClass().addClass("btn btn-default");
        $("#followButton span").removeClass().addClass("glyphicon glyphicon-ok");
        $("#followButton b").text("已关注");
        $("#followButton span").css("color","black");
        $("#followButton b").css("color","black");
      }
      else {
        $("#followButton").removeClass().addClass("btn btn-info");
        $("#followButton span").removeClass().addClass("glyphicon glyphicon-plus");
        $("#followButton b").text("关注");
        $("#followButton span").css("color","white");
        $("#followButton b").css("color","white");
      }

      $("#followButton").click(function () {
        if (follow) {
          follow = false;
          $("#followButton").removeClass().addClass("btn btn-info");
          $("#followButton span").removeClass().addClass("glyphicon glyphicon-plus");
          $("#followButton b").text("关注");
          $("#followButton span").css("color","white");
          $("#followButton b").css("color","white");

          //发送取消关注请求
        }
        else {
          follow = true;
          var oMyForm = new FormData();
          oMyForm.append("followusername", "${user.getUser().getUsername()}");
          var token = $("meta[name='_csrf']").attr("content");
          var header = $("meta[name='_csrf_header']").attr("content");
          var headers = {};
          headers[header] = token;
          $.ajax({
            type:'POST',
            url:"<@s.url action="follow"/>",
            data:oMyForm,
            headers: headers,
            dataType:'html',
            contentType:false,
            processData:false,
            error:function(){
              alert("发生了一些故障，请稍后再试！");
            },
            success:function(){
              $("#followButton").removeClass().addClass("btn btn-default");
              $("#followButton span").removeClass().addClass("glyphicon glyphicon-ok");
              $("#followButton b").text("已关注");
              $("#followButton span").css("color","black");
              $("#followButton b").css("color","black");

            },
          });
        }
      });
      });
      </script>
      </div>
      </#macro>
      <#macro user_sidebar user>
      <div class="thumbnail">
      <div class="caption">
      <#nested>
      <a href="<@s.url namespace="/user" action="${user.getId()}" />">
      <li class="list-group-item">
      <span class="badge">${user.getWeiboAmount()}</span>
      Weibos
      </li>
      </a>
      <a href="<@s.url action="${user.getId()}-get-follow" />">
      <li class="list-group-item">
      <span class="badge">${user.getFollowAmount()}</span>
      关注
      </li>
      </a>
      <a href="<@s.url action="${user.getId()}-get-fans" />">
      <li class="list-group-item">
      <span class="badge">${user.getFansAmount()}</span>
      粉丝
      </li>
      </a>
      </div>
      </div>
      </#macro>

      <!--------------------------------------下面是评论卡片-------------------------------------->
      <#macro comment_card weibo>
      <div>
      <div class="row">
      <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" style="text-align: center">
      <a href="<@s.url namespace="/user" action="${weibo.getUser().getId()}" />">
      <img id="${weibo.getId()}comment_img" width = "40" heighth = "40">
      </a>
      </div>
      <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 row">
      <p>
      <h id="${weibo.getId()}comment_name"></h>
      <!--评论人名称-->
      <h id="${weibo.getId()}comment_content"></h>
      <!--评论人名称-->
      </p>
      <p id="${weibo.getId()}comment_time" class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
      </p><!--评论时间-->
      <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 comment-agree" style="text-align: right">
      <a id="${weibo.getId()}comment_agree" style="display:none" class="btn btn-default btn-xs" href="javascript:agreethecomment${weibo.getId()}()">
      <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
      <b>1</b>
      </a>
      </div>
      </div>
      </div>
      </div>
      </#macro>
      <!--------------------------------------上面是评论卡片-------------------------------------->
