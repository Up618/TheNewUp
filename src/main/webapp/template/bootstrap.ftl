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
  <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/css/jasny-bootstrap.min.css">
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
          <a class="navbar-brand" href="../index">UP</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <form id="search" class="navbar-form navbar-left" role="search">
        	<div class="form-group">
          		<input type="text" class="form-control" placeholder="Search">
        	</div>
        	<button type="submit" class="btn btn-default">Submit</button>
      	  </form>
          <ul class="nav navbar-nav navbar-right">
        	<li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
        			<span class="glyphicon glyphicon-bell" aria-hidden="true"></span><span class="caret"></span>
        		</a>
        	</li>
        	<li class="dropdown">
          		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">个人资料<span class="caret"></span></a>
          		<ul class="dropdown-menu">
            		<li><a href="#">Action</a></li>
            		<li><a href="#">Another action</a></li>
            		<li><a href="#">Something else here</a></li>
            		<li role="separator" class="divider"></li>
            		<li><a href="#">Separated link</a></li>
          		</ul>
        	</li>
        	<li><a href="#"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a></li>
      	  </ul>
        </div>
      </div>
    </nav>
    <#nested>
    <footer style="height:60px;position:absolute;bottom:0;width:100%;background-color:#2a2730">
      <div class="container" style="padding-right:15px;padding-left:15px;margin-top:10px">
        <p style="color:Ivory;text-align:center">Copyright &copy; 2016.UP All rights reserved.</p>
      </div>
    </footer>
    <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
	<script src="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/js/jasny-bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    	
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
    		<a href="#">
      		<img class="media-object" src="${weibo.getUser().getAvatar()}" alt="头像">
    		</a>
  		</div>
  		<div class="media-body">
    		<h4 class="media-heading">${weibo.getUser().getNickname()}</h4>
    		${weibo.getUser().getTime()}
  		</div>
	</div>
  </div>
  <div class="panel-body">
    ${weibo.getContent()}
  </div>
  <div class="panel-footer">
  	<div class="col-md-4">
  	转发
  	</div>
  	<div class="col-md-4">
  	评论
  	</div>
  	<div class="col-md-4">
  	点赞
  	</div>
  </div>
</div>
</#macro>

<#macro user_card user>
<li class="list-group-item">
	
</li>
</#macro>

<#macro user_card_lg user>
</#macro>
