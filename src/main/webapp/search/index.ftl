<#import "/template/bootstrap.ftl" as bootstrap>
<html style="position:relative;min-height:100%;">
<@bootstrap.head title="Search UP!!"></@bootstrap.head>
<@bootstrap.body>
<div class="container" style="padding-top:217;width:50%">
<form action="<@s.url action="result"/>">
	<h1>Search UP!!</h1>
  <div class="input-group">
    <label class="sr-only" for="searchIndexKeyword">搜索</label>
    <input type="text" class="form-control" id="searchIndexKeyword" placeholder="搜索" name="keyword">
    <span class="input-group-btn"><button type="submit" class="btn btn-default">搜索</button></span>
  </div>
</form>
</div>
</@bootstrap.body>
<@bootstrap.javascript/>
</html>
