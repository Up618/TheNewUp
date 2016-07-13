<#import "/template/bootstrap.ftl" as bootstrap>
<#import "/template/usercard.ftl" as bootstrap_usercard>
<html style="position:relative;min-height:100%;">
<@bootstrap.head title="粉丝"></@bootstrap.head>
<@bootstrap.body>
<div class="container" style="padding-top:60px">
	<@bootstrap_usercard.user_card_lg user=user />
	<div class="col-sm-4 col-md-3 col-lg-3 col-md-offset-1 col-lg-offset-1" style="padding-left:0px">
		<@bootstrap.user_sidebar user=user.getUser() />
	</div>
	<script>
	$(document).ready(function () {
		$("#fans-btn").removeClass().addClass("upSidebar-active");
	});
	</script>
	<div class="col-sm-8 col-md-7 col-lg-7">
		<div class="list-group-item row" style="padding:0 0 0 15">
			<h5>粉丝数：${fansAmount}</h5>
		</div>
		<div id="fanspage" class="list-group" data-bind="html:fanss">
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

</@bootstrap.body>

<@bootstrap.javascript>

function fansJ(){
	var self = this;
	var	fansP = 1;
	self.fanss = ko.observable();
	$.ajax({
		url:"${user.getUser().getId()}-get-fans/get-fans",
	}).done(function(data){
		self.fanss(data);
	});
	$("#previousBtn").click(function(){
		fansP--;
		$.ajax({
			data:{page:fansP},
			url:"${user.getUser().getId()}-get-fans/get-fans",
		}).done(function(data){
			self.fanss(data);
		});
	});
	$("#nextBtn").click(function(){
		fansP++;	
		$.ajax({
			data:{page:fansP},
			url:"${user.getUser().getId()}-get-fans/get-fans",
		}).done(function(data){
			self.fanss(data);
		});
	});
}

ko.applyBindings(new fansJ(),document.getElementById("fanspage"));
</@bootstrap.javascript>
</html>
