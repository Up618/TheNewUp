<#import "/template/bootstrap.ftl" as bootstrap>
<html style="position:relative;min-height:100%;">
<@bootstrap.head title="粉丝"></@bootstrap.head>
<@bootstrap.body>
<div class="container row" style="padding-top:60px">
		<div class=" col-lg-3">
			<h1>aaaaa</h1>
			<h3>关注：${followAmount}</h3>
			<h3>粉丝：${fansAmount}</h3>
		</div>
			
	<div class="row col-lg-9">
		<div class="col-sm-3 col-md-3 col-lg-3">
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9">
		<div>
			<h5>粉丝数：${fansAmount}</h5>
		</div>
			<div class="list-group">
				<#list fans as user>
				
					<@bootstrap.user_card user=user/>
				
				
				<!--
					<div class="list-group-item row">
					  <div class="col-lg-2 col-md-2 col-sm-3 col-xs-4">
					    <a href="<@s.url namespace="/user" action="${user.getId()}" />" class="thumbnail">
					    <img class="img-responsive" src="${user.getAvatar()}" alt="头像">
					  </a>
					</div>
					<div class="col-lg-7 col-md-7 col-sm-6 col-xs-7">
					  <h3>${user.getNickname()}</h3>
					  <p>关注数${user.getFollowAmount()}  粉丝数${user.getFansAmount()}  微博数<a href="<@s.url namespace="/user" action="${user.getId()}" />">${user.getWeiboAmount()}</a></p>
					  <p>${user.getSignature()!" "}</p>
					</div>
					<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
					  <button class="btn btn-default btn-sm" style="font-weight: 600; display: none"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span> 已关注</button>
					  
					  <button id = "${user.getUsername()}btn" class="btn btn-default btn-sm" style="font-weight: 600;">
					  <span style="color: #ff9900" action="getfans" class="glyphicon glyphicon-plus" aria-hidden="true"></span> 
					  	
					  	关注
					  </button>
					</div>
					
				 <script type="text/javascript">
				 	$(document).ready(function(){
				 		$("#${user.getUsername()}btn").click(function(){
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
				 					alert("诶诶，可以了可以了");
				 				},
				 			});
				 		});				 		
				 	})	 		
                 </script>
					</div>-->
				</#list>
				
				
			</div>
		</div>
	</div>
</div>



</@bootstrap.body>
</html>