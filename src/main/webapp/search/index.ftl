<#import "/template/bootstrap.ftl" as bootstrap>
<html style="position:relative;min-height:100%;">
<@bootstrap.head title="账户设置"></@bootstrap.head>
<@bootstrap.body>
<div class="container" style="padding-top:217;width:50%">
<form action="<@s.url action="result"/>">
	<h1>Search UP!!</h1>
  <div class="input-group">
    <label class="sr-only" for="searchIndexKeyword">Search</label>
    <input type="text" class="form-control" id="searchIndexKeyword" placeholder="Search" name="keyword">
    <span class="input-group-btn"><button type="submit" class="btn btn-default">Search</button></span>
  </div>
</form>
</div>
</@bootstrap.body>
<@bootstrap.javascript/>
</html>
