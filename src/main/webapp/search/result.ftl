<#import "/template/bootstrap.ftl" as bootstrap>
<html style="position:relative;min-height:100%;">
<@bootstrap.head title="搜索"></@bootstrap.head>
<@bootstrap.body>

<div class="modal fade bs-example-modal-lg" id="imgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <img id="modelImg" src="" width="600px">
    </div>

    <a class="left" href="javascript:lastImg()"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span></a>
    <a class="right" href="javascript:nextImg()"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></a>
</div>

<div class="container" style="padding-top:60px">
  <form class="form-horizontal" action="<@s.url action="result"/>">
  <div class="form-group">
  	<label for="resultKeyword" class="col-sm-3 control-label">搜索</label>
    <div class="col-sm-8">
    	<input id="resultKeyword" type="text" class="form-control" placeholder="搜索" name="keyword" value="${keyword}">
    </div>
    <div class="sol-sm-1">
      <button type="submit" class="btn btn-default">搜索</button>
    </div>
  </div>
</form>
<div class="col-lg-3 col-md-3 col-sm-3" style="padding-left:0px">
  <div class="panel panel-default">
    <!-- Default panel contents -->
    <div class="panel-heading">分类</div>
    <ul class="list-group">
      <a id="weiboSearch" href="#" class="list-group-item active">微博</a>
      <a id="userSearch" href="#" class="list-group-item">人</a>
      <a href="#" class="list-group-item">图片</a>
      <a href="#" class="list-group-item">评论</a>
    </ul>
  </div>
</div>
<div id = "resultList" data-bind="html:results" class="col-lg-9 col-md-9 col-sm-9">

</div>

<nav>
  <ul class="pager">
    		<button id="previousBtn" class="btn-link">上一页</button>
    		<button id="nextBtn" class="btn-link">下一页</button>
  </ul>
</nav>
</div>
</@bootstrap.body>
<@bootstrap.javascript>
function result(){
	var selt = this;
	var startpage = 1;
		var userweibo = "weibo";
	var word = $("#resultKeyword").val();
	self.results = ko.observable();
	$.ajax({
		data:{keyword:word},
		url:userweibo+"-search",
	}).done(function(data){
		self.results(data);
	});
	$("#weiboSearch").click(function(){
		startpage = 1;
		userweibo = "weibo";
		$("#weiboSearch").removeClass().addClass("list-group-item active");
		$("#userSearch").removeClass().addClass("list-group-item");
		$.ajax({
			data:{keyword:word},
			url:userweibo+"-search",
		}).done(function(data){
			self.results(data);
		});
	});
	$("#previousBtn").click(function(){
		startpage--;
		$.ajax({
			data:{page:startpage,keyword:word},
			url:userweibo+"-search",
		}).done(function(data){
			self.results(data);
		});
	});
	$("#nextBtn").click(function(){
		startpage++;
		$.ajax({
			data:{page:startpage,keyword:word},
			url:userweibo+"-search",
		}).done(function(data){
			self.results(data);
		});
	});
	$("#userSearch").click(function(){
		startpage = 1;
		userweibo = "user";
		$("#userSearch").removeClass().addClass("list-group-item active");
		$("#weiboSearch").removeClass().addClass("list-group-item");
		$.ajax({
			data:{page:startpage,keyword:word},
			url:userweibo,
		}).done(function(data){
			self.results(data);
		});
	});
}



ko.applyBindings(new result(),document.getElementById("resultList"));

</@bootstrap.javascript>
</html>
