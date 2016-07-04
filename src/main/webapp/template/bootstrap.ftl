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
  <link href="https://cdn.bootcss.com/jasny-bootstrap/3.1.3/css/jasny-bootstrap.min.css" rel="stylesheet">
  <#nested>
  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
</#macro>

<#macro body>
<body style="margin-bottom:60px">
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
          <li><a href="<@s.url namespace="/" action="logout"/>">Sign out</a></li>
        </ul>
      </li>
      <li><a href="#" data-toggle="modal" data-target=".bs-example-modal-lg"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a></li>
    </ul>
  </div>
</div>
</nav>
<#nested>
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
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">UP!</button>
      </div>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
  </div>
</div>
</div>
<footer style="height:60px;position:absolute;bottom:0;width:100%;background-color:#2a2730">
  <div class="container" style="padding-right:15px;padding-left:15px;margin-top:10px">
    <p style="color:Ivory;text-align:center">Copyright &copy; 2016.UP All rights reserved.</p>
  </div>
</footer>
<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.bootcss.com/jasny-bootstrap/3.1.3/js/jasny-bootstrap.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://cdn.bootcss.com/knockout/3.4.0/knockout-min.js"></script>
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
}
$(function() {
  // Handler for .ready() called.
  var app = new ViewModel();
  ko.applyBindings(app);
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
<div class="panel panel-default">
  <div class="panel-heading">
    <div class="media">
      <div class="media-left">
        <a href="<@s.url namespace="/user" action="${weibo.getUser().getId()}" />">
        <img class="media-object" src="${weibo.getUser().getAvatar()}" alt="头像" height="64" width="64">
      </a>
    </div>
    <div class="media-body">
      <h3 class="media-heading">${weibo.getUser().getNickname()}</h3>
      <p>${weibo.getTime()}</p>
    </div>
  </div>
</div>
<div class="panel-body">
  <#nested>
</div>
<div class="panel-footer">
  <div class="col-md-4">
    <p>转发</p>
  </div>
  <div class="col-md-4">
    <p>评论</p>
  </div>
  <div class="col-md-4">
    <p>点赞</p>
  </div>
</div>
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
  <p>关注数 粉丝数 微博数<a href="<@s.url namespace="/user" action="${user.getId()}" />">${user.getWeiboAmount()}</a></p>
  <p>${user.getSignature()!" "}</p>
</div>
<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
  <button class="btn btn-default btn-sm" style="font-weight: 600; display: none"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span> 已关注</button>
  <button class="btn btn-default btn-sm" style="font-weight: 600;"><span style="color: #ff9900" class="glyphicon glyphicon-plus" aria-hidden="true"></span> 关注</button>
</div>
</div>
</#macro>

<#macro user_card_lg user>
<div class="jumbotron" style="text-align:center;">
  <div class="thumbnail">
    <img src="${user.getAvatar()}" alt="头像" height="80" width="80">
  </div>
  <h4>${user.getNickname()}</h4>
  <p>${user.getSignature()!" "}</p>
  <button>关注</button>
</div>
</#macro>
