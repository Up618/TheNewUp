﻿<#macro head title>
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
  <link href="http://o9x8azwl1.bkt.clouddn.com/newnewup.css" rel="stylesheet">
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
</head>
</#macro>

<#macro body>
<body style="margin-bottom:60px;">
  <nav class="navbar navbar-inverse navbar-fixed-top">
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
<script type="text/javascript">
function ViewModel(){
  var self = this;
  self.avatar = ko.observable();
  self.nickname = ko.observable();
  $.ajax({
    type: 'GET',
    url: "<@s.url namespace="/api" action="user" />",
  }).done(function (data) {
    self.avatar(data.avatar);
    self.nickname(data.nickname);
  });
  self.signOut = function(){
    $("#sign-out").submit();
  };

}
$(function() {
  // Handler for .ready() called.
  var app = new ViewModel();
  ko.applyBindings(app);

  var token = $("meta[name='_csrf']").attr("content");
  var header = $("meta[name='_csrf_header']").attr("content");
  var headers = {};
  headers[header] = token;
  $("input[name='upload']").change(function(){
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
    $("<li class=\"has-pic-li\"><a href=\"#\"><span class=\"glyphicon glyphicon-remove\" aria-hidden=\"true\"></span></a><img src=\"\" alt=\"加载中\" /></li>").insertBefore($("li.no-pic-li"));
    e.stopPropagation();
  });
  $("li.no-pic-li").click(function(e){
    $("input[name='upload']").click();
    e.stopPropagation();
  });
});
</script>
</body>
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
        <a href="<@s.url namespace="/user" action="${weibo.getUser().getId()}" />">
            <img class="img-thumbnail" src="${weibo.getUser().getAvatar()}" alt="头像" width="60">
        </a>
    </div>
    <div class="col-lg-9 col-md-9 col-sm-8 col-xs-8">
        <div class="up-content" style="height: auto">
            <p class="up-sign-nickname">
                <a href="<@s.url namespace="/user" action="${weibo.getUser().getId()}" />">
                    ${weibo.getUser().getNickname()}：
                </a>
            </p>
            <p class="up-time">${weibo.getTime()}</p>
            <s><i></i></s>
            <p class="up-body">
                <#nested>
            </p>
            
            <div id="firstWeiboImg" style="margin-left: 20px; margin-right: 20px;">
                <img  id="firWeiboFirstImg" src="" style="float: left;" data-toggle="modal" data-target="#imgModal" >
                <img  id="secWeiboFirstImg" src="" style="float: left;" data-toggle="modal" data-target="#imgModal" >
                <img  id="thiWeiboFirstImg" src="" style="float: left;" data-toggle="modal" data-target="#imgModal" >
                <img  id="fouWeiboFirstImg" src="" style="float: left;" data-toggle="modal" data-target="#imgModal" >
                <img  id="fivWeiboFirstImg" src="" style="float: left;" data-toggle="modal" data-target="#imgModal" >
                <img  id="sixWeiboFirstImg" src="" style="float: left;" data-toggle="modal" data-target="#imgModal" >
                <img  id="sevWeiboFirstImg" src="" style="float: left;" data-toggle="modal" data-target="#imgModal" >
                <img  id="eigWeiboFirstImg" src="" style="float: left;" data-toggle="modal" data-target="#imgModal" >
                <img  id="ninWeiboFirstImg" src="" style="float: left;" data-toggle="modal" data-target="#imgModal" >
            </div>
            <div class="clearfix"></div>
                        
            <hr style="margin-bottom: 10px"/>

            <div class="row up-operat">
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                    <p align="center" class="up-operate"><a><span class="glyphicon glyphicon-share" aria-hidden="true"></span> 转发</a></p>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                    <p align="center" class="up-operate"><a id="${weibo.getId()}comment" data-toggle="modal" data-target="#${weibo.getId()}up-comment"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span> 评论</a></p>
                </div>
                
<!-----------------------------------评论的获取函数---------------------------------->
<script type="text/javascript">
$(document).ready(function () {
                	$("#${weibo.getId()}comment").click(function(){
                        var self = this;
                        self.avatar = ko.observable();
                        self.nickname = ko.observable();
                        self.time = ko.observable();
                        self.content = ko.observable("");
                	    $.ajax({
                		    type: 'GET',
                            url: "<@s.url namespace="/comment" action="comment"><@s.param name="weibo_id" value="${weibo.getId()}"/> </@s.url>",
                	    }).done(function (data) {
                	    if(data.nickname!=null){
                	        $("#${weibo.getId()}comment_name").text(data.nickname+"：");
                	    }
                	    if(data.content!=null){
                	        $("#${weibo.getId()}comment_content").text(data.content);
                	    }
                	    if(data.time){
                	        $("#${weibo.getId()}comment_time").text(data.time);
                	    }
                	    if(data.avatar!=null){
                	        document.getElementById("${weibo.getId()}comment_img").src=data.avatar;
                	    }
                	    	self.nickname(data.nickname);
                            self.content(data.content);
                            self.time(data.time);
                            self.avatar(data.avatar);
                	    }) //done
                    }); //click   
                }); //document.ready
</script>
<!-----------------------------------评论的获取函数---------------------------->

                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                    <p align="center" class="up-operate">
                    	<a id="${weibo.getId()}agree" href="#${weibo.getId()}">
                    		<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
                    		点赞
                    		<b>${weibo.getAgreeAmount()}</b>
                    	</a>
                    </p>
                </div>
            </div>

            <script>
                
                $(document).ready(function () {
                	$("#${weibo.getId()}agree").click(function(){
                        var token = $("meta[name='_csrf']").attr("content"); //之前已经把对应的变量存入<head>的<meta>中
						var header = $("meta[name='_csrf_header']").attr("content");
						var headers = {};
						headers[header] = token;
                	    $.ajax({
                		    type: 'POST',
                		    dataType:'json',
                		    headers: headers,
                		    url: "<@s.url namespace="/agree" action="agree"><@s.param name="weibo_id" value="${weibo.getId()}"/> </@s.url>",
                	    	//传一个微博id的param到后台
                	}).done(function (data) {
                	    //alert(data.ifLiked);
                	//判断按钮样式
                	if (!data.ifLiked) {
                        $("#${weibo.getId()}agree b").text(parseInt($("#${weibo.getId()}agree b").text()) + 1);
                        agree${weibo.getId()} = true;
                        $("#${weibo.getId()}agree").css("color", "red");
                        $("#${weibo.getId()}agree").mouseover(function () {
                            $("#${weibo.getId()}agree").css("color", "black");
                        });
                        $("#${weibo.getId()}agree").mouseout(function () {
                            $("#${weibo.getId()}agree").css("color", "red");
                        });
                    }//if
                    else {
                        $("#${weibo.getId()}agree b").text(parseInt($("#${weibo.getId()}agree b").text()) - 1);
                        agree${weibo.getId()} = false;
                        $("#${weibo.getId()}agree").css("color", "black");
                            $("#${weibo.getId()}agree").mouseover(function () {
                                $("#${weibo.getId()}agree").css("color", "red");
                            });
                            $("#${weibo.getId()}agree").mouseout(function () {
                                $("#${weibo.getId()}agree").css("color", "black");
                            });
                    }//else
                	}) //done
                    }); //click
                }); //document.ready
                
                </script>
            </div>
        </div>
    </div>
<div class="modal fade" id="${weibo.getId()}up-comment" tabindex="-1" role="dialog" aria-labelledby="${weibo.getId()}comment-title" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <p class="comment-title">评论</p>
            </div>
            <div class="modal-body">
                <div class="row" style="margin-left: 0px; margin-right: 0px;">
                        <p>${weibo.getContent()}</p>
                        <form id="in" action="../comment/inputComment" method="post">
                            <input type="hidden"  name="weibo_id" value="${weibo.getId()}"/>
                            <textarea name="content" class="form-control" rows="2" style="resize:none;"
                                  placeholder="评论......" required></textarea>
                            <div style="text-align: right">
                                <button type="submit" class="btn btn-primary" style="margin-top: 10px">UP!</button>
                            </div>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </form>

                        <hr style="margin-bottom: 10px"/>

                        <div>
                            <div class="row">
                                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" style="text-align: center">
                                    <a href="<@s.url namespace="/user" action="${weibo.getUser().getId()}" />">
                                        <img id="${weibo.getId()}comment_img", text: nickname", width = "40", heighth = "40">
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
                                    <a id="${weibo.getId()}comment_agree" class="btn btn-default btn-xs" href="javascript:agreethecomment${weibo.getId()}()"><span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span><b>1</b></a>
                                </div>
                                <script>
                                    var comment_agree${weibo.getId()} = true;                 <!--把true改作是否点赞的布尔值-->

                                    $(document).ready(function () {
                                        if (!comment_agree${weibo.getId()}) {
                                            $("#${weibo.getId()}comment_agree").css("color", "black");
                                            $("#${weibo.getId()}comment_agree").mouseover(function () {
                                                $("#${weibo.getId()}comment_agree").css("color", "red");
                                            });
                                            $("#${weibo.getId()}comment_agree").mouseout(function () {
                                                $("#${weibo.getId()}comment_agree").css("color", "black");
                                            });
                                        }
                                        else {
                                            $("#${weibo.getId()}comment_agree").css("color", "red");
                                            $("#${weibo.getId()}comment_agree").mouseover(function () {
                                                $("#${weibo.getId()}comment_agree").css("color", "black");
                                            });
                                            $("#${weibo.getId()}comment_agree").mouseout(function () {
                                                $("#${weibo.getId()}comment_agree").css("color", "red");
                                            })
                                        }
                                    });
                                    function agreethecomment${weibo.getId()}() {
                                        if (!comment_agree${weibo.getId()}) {
                                            $("#${weibo.getId()}comment_agree b").text(parseInt($("#${weibo.getId()}comment_agree b").text()) + 1);
                                            comment_agree${weibo.getId()} = true;
                                            $("#${weibo.getId()}comment_agree").css("color", "red");
                                            $("#${weibo.getId()}comment_agree").mouseover(function () {
                                                $("#${weibo.getId()}comment_agree").css("color", "black");
                                            });
                                            $("#${weibo.getId()}comment_agree").mouseout(function () {
                                                $("#${weibo.getId()}comment_agree").css("color", "red");
                                            });

                                            //这个地方发评论点赞请求
                                        }
                                        else {
                                            $("#${weibo.getId()}comment_agree b").text(parseInt($("#${weibo.getId()}comment_agree b").text()) - 1);
                                            comment_agree${weibo.getId()} = false;
                                            $("#${weibo.getId()}comment_agree").css("color", "black");
                                            $("#${weibo.getId()}comment_agree").mouseover(function () {
                                                $("#${weibo.getId()}comment_agree").css("color", "red");
                                            });
                                            $("#${weibo.getId()}comment_agree").mouseout(function () {
                                                $("#${weibo.getId()}comment_agree").css("color", "black");
                                            });

                                            //这个地方发取消评论点赞请求
                                        }
                                    }
                                </script>
                                </div>
                            </div>
                        </div>
                </div>

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</#macro>

<#macro user_card user>
<div class="list-group-item row">
    <div class="col-lg-2 col-md-2 col-sm-3 col-xs-4">
        <a href="<@s.url namespace="/user" action="${user.getId()}" />" class="thumbnail">
            <img class="img-responsive" src="${user.getAvatar()}" alt="头像">
        </a>
    </div>
    <div class="col-lg-8 col-md-8 col-sm-7 col-xs-8">
        <h3>${user.getNickname()}</h3>
        <p>关注数${user.getFollowAmount()}   粉丝数${user.getFansAmount()}   微博数<a href="<@s.url namespace="/user" action="${user.getId()}" />">${user.getWeiboAmount()}</a></p>
        <p>${user.getSignature()!" "}</p>
    </div>
    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
        <button id="${user.getNickname()}followButton" class="btn btn-info"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span><b>关注</b></button>
    </div>
    <script type="text/javascript">
        var ${user.getNickname()}follow = false;                        //这地方写是否关注
        $(document).ready(function () {

            if (${user.getNickname()}follow) {
                $("#${user.getNickname()}followButton").removeClass().addClass("btn btn-default");
                $("#${user.getNickname()}followButton span").removeClass().addClass("glyphicon glyphicon-ok");
                $("#${user.getNickname()}followButton b").text("已关注");
                $("#${user.getNickname()}followButton span").css("color","black");
                $("#${user.getNickname()}followButton b").css("color","black");
            }
            else {
                $("#${user.getNickname()}followButton").removeClass().addClass("btn btn-info");
                $("#${user.getNickname()}followButton span").removeClass().addClass("glyphicon glyphicon-plus");
                $("#${user.getNickname()}followButton b").text("关注");
                $("#${user.getNickname()}followButton span").css("color","white");
                $("#${user.getNickname()}followButton b").css("color","white");
            }
            
            $("#${user.getNickname()}followButton").click(function () {
                if (${user.getNickname()}follow) {
                    ${user.getNickname()}follow = false;
                    $("#${user.getNickname()}followButton").removeClass().addClass("btn btn-info");
                    $("#${user.getNickname()}followButton span").removeClass().addClass("glyphicon glyphicon-plus");
                    $("#${user.getNickname()}followButton b").text("关注");
                    $("#${user.getNickname()}followButton span").css("color","white");
                    $("#${user.getNickname()}followButton b").css("color","white");


                                        //发送取消关注请求
                }
                else {
                    ${user.getNickname()}follow = true;
				 			var oMyForm = new FormData();
				 			oMyForm.append("followusername", "${user.getUsername()}");
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
                    				$("#${user.getNickname()}followButton").removeClass().addClass("btn btn-default");
                   					 $("#${user.getNickname()}followButton span").removeClass().addClass("glyphicon glyphicon-ok");
                  					 $("#${user.getNickname()}followButton b").text("已关注");
                				    $("#${user.getNickname()}followButton span").css("color","black");
                 					$("#${user.getNickname()}followButton b").css("color","black");

				 					alert(	"已成功关注！");
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
        <img class="img-thumbnail" src="${user.getAvatar()}" alt="头像" alt="头像" height="120" width="120">
        <h2>${user.getNickname()}</h2>
        <p>${user.getSignature()!" "}</p>
        <button id="followButton" class="btn btn-info"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span><b>关注</b></button>
    </div>

    <script type="text/javascript">
        var follow = false;                        //这地方写是否关注
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
				 			alert("来啊！");
				 			var oMyForm = new FormData();
				 			oMyForm.append("followusername", "${user.getUsername()}");
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
										alert("错误");
								},
				 				success:function(){
				 					alert(	"诶诶，可以了可以了");
                    $("#followButton").removeClass().addClass("btn btn-default");
                    $("#followButton span").removeClass().addClass("glyphicon glyphicon-ok");
                    $("#followButton b").text("已关注");
                    $("#followButton span").css("color","black");
                    $("#followButton b").css("color","black");
				 					
				 				},
				 			});
                    

                            //发送关注请求
                }
            });
        });
        
        	
    </script>
</div>
</#macro>
