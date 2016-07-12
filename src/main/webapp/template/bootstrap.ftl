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
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><img data-bind="attr: { src: avatar, height: '20', width: '20' }"><span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li>
            <div style="padding:3px 20px;">Signed in as
              <span id="myNicknameOnNavbar" data-bind="text: nickname" style="font-weight:bolder;"></span>
            </div>
          </li>
          <li role="separator" class="divider"></li>
          <li><a data-bind="attr: {href: homepageLink}">Your homepage</a></li>
          <li><a href="<@s.url namespace="/user" action="profile"/>">Your profile</a></li>
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
  self.homepageLink = ko.observable();
  self.phoneNumber = ko.observable();
  self.email = ko.observable();
  self.bio = ko.observable();
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
    self.phoneNumber(data.user.user.phoneNumber);
    self.email(data.user.user.email);
    self.homepageLink("<@s.url namespace="/user" action="username"/>?username="+self.username());
    self.bio(data.user.user.bio);
  });
  self.signOut = function(){
    $("#sign-out").submit();
  };

}
  var app = new ViewModel();
  ko.applyBindings(app,document.getElementById("nav"));
$(function() {
  // Handler for .ready() called.


  var token = $("meta[name='_csrf']").attr("content");
  var header = $("meta[name='_csrf_header']").attr("content");
  var headers = {};
  headers[header] = token;
  $("#pic-upload input[name='upload']").change(function(){
    $("<li class=\"has-pic-li\"><a href=\"#\"><span class=\"glyphicon glyphicon-remove\" aria-hidden=\"true\"></span></a><img src=\"\" alt=\"加载中\" /></li>").insertBefore($("li.no-pic-li"));
    var fd = new FormData();
    fd.append("upload",$("#pic-upload input[name='upload']")[0].files[0]);
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
  $("#pic-upload input[name='upload']").click(function(e){
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

  <#macro user_sidebar user>
  <div class="thumbnail">
  <div class="caption upSidebar">
  <#nested>
  <a href="<@s.url namespace="/user" action="${user.getId()}" />">
  <li class="list-group-item">
  <span class="badge">${user.getWeiboAmount()}</span>
  Weibos
  </li>
  </a>
  <a href="<@s.url namespace="/" action="${user.getId()}-get-follow" />">
  <li class="list-group-item">
  <span class="badge">${user.getFollowAmount()}</span>
  关注
  </li>
  </a>
  <a href="<@s.url namespace="/" action="${user.getId()}-get-fans" />">
  <li class="list-group-item">
  <span class="badge">${user.getFansAmount()}</span>
  粉丝
  </li>
  </a>
  </div>
  </div>

  <div class="thumbnail">
  <div class="caption upSidebar">
  <#nested>
  <a href="<@s.url namespace="/agree" action="${user.getId()}-liked-weibo" />">
  <li class="list-group-item">
  <span class="badge">${user.getLikedWeiboAmount()}</span>
	${user.getNickname()}赞过的微博
  </li>
  </a>
  </div>
  </div>
  </#macro>
