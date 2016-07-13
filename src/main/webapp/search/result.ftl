<#import "/template/bootstrap.ftl" as bootstrap>
<html style="position:relative;min-height:100%;">
<@bootstrap.head title="账户设置"></@bootstrap.head>
<@bootstrap.body>
<div class="container" style="padding-top:60px">
  <form class="form-horizontal" action="<@s.url action="result"/>">
  <div class="form-group">
  	<label for="resultKeyword" class="col-sm-3 control-label">Search</label>
    <div class="col-sm-8">
    	<input id="resultKeyword" type="text" class="form-control" placeholder="Search" name="keyword" value="${keyword}">
    </div>
    <div class="sol-sm-1">
      <button type="submit" class="btn btn-default">Submit</button>
    </div>
  </div>
</form>
<div class="col-lg-3 col-md-3 col-sm-3" style="padding-left:0px">
  <div class="panel panel-default">
    <!-- Default panel contents -->
    <div class="panel-heading">Options</div>
    <ul class="list-group">
      <a href="#" class="list-group-item active">微博</a>
      <a href="#" class="list-group-item">人</a>
      <a href="#" class="list-group-item">图片</a>
      <a href="#" class="list-group-item">评论</a>
    </ul>
  </div>
</div>
<div class="col-lg-9 col-md-9 col-sm-9">
</div>
</div>
</@bootstrap.body>
<@bootstrap.javascript/>
</html>
