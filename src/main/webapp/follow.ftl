<#import "/template/bootstrap.ftl" as bootstrap>
<#import "/template/usercard.ftl" as bootstrap_usercard>
<html style="position:relative;min-height:100%;">
<@bootstrap.head title="关注"></@bootstrap.head>
<@bootstrap.body>
<div class="container" style="padding-top:60px">
	<div class="row">
		<@bootstrap_usercard.user_card_lg user=user />
	</div>
	 <div class="row">

		<div class="col-sm-1 col-md-1 col-lg-1">
		</div>
		<div class="row col-lg-10">
		<div class="col-sm-3 col-md-3 col-lg-3">
			<@bootstrap.user_sidebar user=user.getUser() />
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9">
		<div class="list-group-item row" style="padding:0 0 0 15">
			<h5>全部关注：${followAmount}</h5>
			</div>
			<div id="followpage" class="list-group" data-bind="html:follows">
			</div>
			
<nav>
  <ul id="follow-pager" class="pager">
  	<#if pageNum == 1>
  	
  	<#else>
    		<button id="previousBtn" class="previous">上一页</button>
    		<button id="nextBtn" class="next">下一页</button>
    
	</#if>
  </ul>
</nav>
		</div>
	</div>
	</div>
</div>
</@bootstrap.body>



<@bootstrap.javascript>
function followJ(){
	var self = this;
	var followP = 1;
	self.follows = ko.observable();
	$.ajax({
		url:"${user.getUser().getId()}-get-follow/get-follow",
	}).done(function(data){
		self.follows(data);
	});
	$("#previousBtn").click(function(){
		followP--;
		$.ajax({
			data:{page:followP},
			url:"${user.getUser().getId()}-get-follow/get-follow",
		}).done(function(data){
			self.follows(data);
		});
	});
	$("#nextBtn").click(function(){
		followP++;
		$.ajax({
			data:{page:followP},
			url:"${user.getUser().getId()}-get-follow/get-follow",
		}).done(function(data){
			self.follows(data);
		});
	});
}

ko.applyBindings(new followJ(),document.getElementById("followpage"));
</@bootstrap.javascript>
</html>
