<#import "/template/bootstrap.ftl" as bootstrap>



<#macro user_card_lg user>
<div style="text-align:center;">
	<div class="thumbnail userCard">
		<img class="img-thumbnail" src="${user.getUser().getAvatar()}" alt="头像" alt="头像" height="120" width="120">
		<h2>${user.getUser().getNickname()}</h2>
		<p>${user.getUser().getBio()!" "}</p>
		<button id="followButton${user.getUser().getId()}" class="btn btn-info"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span><b>关注</b></button>
	</div>
	<script type="text/javascript">
		var following${user.getUser().getId()} = ${user.getFollowing()?then('true','false')};
		var followed${user.getUser().getId()} = ${user.getFollower()?then('true','false')};
		$(document).ready(function () {
		if(${user.getIsMe()?then('true','false')}){
			$("#followButton${user.getUser().getId()}").hide();
		}
		if (following${user.getUser().getId()}&&followed${user.getUser().getId()}) {
            $("#followButton${user.getUser().getId()}").removeClass().addClass("btn btn-default");
            $("#followButton${user.getUser().getId()} span").removeClass().addClass("glyphicon glyphicon-retweet");
            $("#followButton${user.getUser().getId()} b").text("互相关注");
            $("#followButton${user.getUser().getId()} span").css("color","black");
            $("#followButton${user.getUser().getId()} b").css("color","black");
	  	}
		else if(following${user.getUser().getId()}){		
            $("#followButton${user.getUser().getId()}").removeClass().addClass("btn btn-default");
            $("#followButton${user.getUser().getId()} span").removeClass().addClass("glyphicon glyphicon-ok");
            $("#followButton${user.getUser().getId()} b").text("已关注");
            $("#followButton${user.getUser().getId()} span").css("color","black");
            $("#followButton${user.getUser().getId()} b").css("color","black");
		}
		else{
    		$("#followButton${user.getUser().getId()}").removeClass().addClass("btn btn-info");
    		$("#followButton${user.getUser().getId()} span").removeClass().addClass("glyphicon glyphicon-plus");
    		$("#followButton${user.getUser().getId()} b").text("关注");
    		$("#followButton${user.getUser().getId()} span").css("color","white");
    		$("#followButton${user.getUser().getId()} b").css("color","white");
  		}

  		$("#followButton${user.getUser().getId()}").click(function () {
            	if(following${user.getUser().getId()}){
				 			var oMyForm = new FormData();
				 			oMyForm.append("followusername", "${user.getUser().getUsername()}");
				 			var token = $("meta[name='_csrf']").attr("content");
							var header = $("meta[name='_csrf_header']").attr("content");
							var headers = {};
							headers[header] = token;
				 			$.ajax({
				 				type:'POST',
				 				url:"<@s.url namespace="/" action="delete-follow"/>",
				 				data:oMyForm,
 								headers: headers,
				 				dataType:'html',
  								contentType:false,
 								processData:false,
				 				error:function(){	
										alert("发生了一些错误，请稍后再试！");
								},
				 				success:function(){
                    
                    
                    $("#followButton${user.getUser().getId()}").removeClass().addClass("btn btn-info");
                    $("#followButton${user.getUser().getId()} span").removeClass().addClass("glyphicon glyphicon-plus");
                    $("#followButton${user.getUser().getId()} b").text("关注");
                    $("#followButton${user.getUser().getId()} span").css("color","white");
                    $("#followButton${user.getUser().getId()} b").css("color","white");
                    following${user.getUser().getId()} = false;
				 					
				 				},
				 			});
				 	}
				 	else{
				 			var oMyForm = new FormData();
				 			oMyForm.append("followusername", "${user.getUser().getUsername()}");
				 			var token = $("meta[name='_csrf']").attr("content");
							var header = $("meta[name='_csrf_header']").attr("content");
							var headers = {};
							headers[header] = token;
				 			$.ajax({
				 				type:'POST',
				 				url:"<@s.url namespace="/" action="follow"/>",
				 				data:oMyForm,
 								headers: headers,
				 				dataType:'html',
  								contentType:false,
 								processData:false,
				 				error:function(){	
										alert("发生了一些错误，请稍后再试！");
								},
				 				success:function(){
				 				if(followed${user.getUser().getId()}){
                $("#followButton${user.getUser().getId()}").removeClass().addClass("btn btn-default");
                $("#followButton${user.getUser().getId()} span").removeClass().addClass("glyphicon glyphicon-retweet");
                $("#followButton${user.getUser().getId()} b").text("互相关注");
                $("#followButton${user.getUser().getId()} span").css("color","black");
                $("#followButton${user.getUser().getId()} b").css("color","black");
                 				}
                 				else{
                 				
                    				$("#followButton${user.getUser().getId()}").removeClass().addClass("btn btn-default");
                   					 $("#followButton${user.getUser().getId()} span").removeClass().addClass("glyphicon glyphicon-ok");
                  					 $("#followButton${user.getUser().getId()} b").text("已关注");
                				    $("#followButton${user.getUser().getId()} span").css("color","black");
                 					$("#followButton${user.getUser().getId()} b").css("color","black");
                 				}	following${user.getUser().getId()} = true;
				 				},
				 			});
                    
				 	}
  		});
  	});
  	</script>
  </div>
  </#macro>
  
<#macro fans_follow_card user>

				<div class="list-group-item row" style="margin-bottom:10px">
	    		<div class="col-lg-2 col-md-2 col-sm-3 col-xs-4">
	        		<a href="<@s.url namespace="/user" action="${user[0].getId()}" />" class="thumbnail">
	            					<img class="img-responsive" src="${user[0].getAvatar()}" alt="头像">
	        					</a>
	    					</div>
	    					<div class="col-lg-7 col-md-7 col-sm-6 col-xs-8">
	        					<h3>${user[0].getNickname()}</h3>
	        					<p>
	        						<a href="<@s.url action="${user[0].getId()}-get-follow" />">关注${user[0].getFollowAmount()}</a>
	        						<a href="<@s.url action="${user[0].getId()}-get-fans" />">粉丝${user[0].getFansAmount()}</a>
	        						<a href="<@s.url namespace="/user" action="${user[0].getId()}" />">微博数${user[0].getWeiboAmount()}</a>
	        					</p>
	        					<p>${user[0].getBio()!" "}</p>
	    					</div>
	    					<div class="col-lg-3 col-md-3 col-sm-3 col-xs-8">
	        					<button id="${user[0].getUsername()}followButton" style = "width:100px;right:10px;position:absolute" class="btn btn-info">
	        						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
	        						<b>关注</b>
	        					</button>
	    					</div>
	    					<script type="text/javascript">
	        					var b1${user[0].getUsername()} = ${user[1]};
	       						var b2${user[0].getUsername()} = ${user[2]};
	       						var b3${user[0].getUsername()} = ${user[3]};
	        					$(document).ready(function () {
	        					if(b3${user[0].getUsername()}){
	        						$("#${user[0].getUsername()}followButton").hide();
	        					}
	            				if (b1${user[0].getUsername()}&&b2${user[0].getUsername()}) {
	               					$("#${user[0].getUsername()}followButton").removeClass().addClass("btn btn-default");
	                				$("#${user[0].getUsername()}followButton span").removeClass().addClass("glyphicon glyphicon-retweet");
	                				$("#${user[0].getUsername()}followButton b").text("互相关注");
	                				$("#${user[0].getUsername()}followButton span").css("color","black");
	                				$("#${user[0].getUsername()}followButton b").css("color","black");
	            				}
	           					else if(b1${user[0].getUsername()}){
	               					$("#${user[0].getUsername()}followButton").removeClass().addClass("btn btn-info");
	                				$("#${user[0].getUsername()}followButton span").removeClass().addClass("glyphicon glyphicon-ok");
	                				$("#${user[0].getUsername()}followButton b").text("已关注");
	                				$("#${user[0].getUsername()}followButton span").css("color","white");
	                				$("#${user[0].getUsername()}followButton b").css("color","white");
	            				}
	            				else{
	                				$("#${user[0].getUsername()}followButton").removeClass().addClass("btn btn-info");
	                				$("#${user[0].getUsername()}followButton span").removeClass().addClass("glyphicon glyphicon-plus");
	                				$("#${user[0].getUsername()}followButton b").text("关注");
	                				$("#${user[0].getUsername()}followButton span").css("color","white");
	                				$("#${user[0].getUsername()}followButton b").css("color","white");
	           					}
	            				$("#${user[0].getUsername()}followButton").click(function () {
	                				if (b1${user[0].getUsername()}) {
					 					var oMyForm = new FormData();
					 					oMyForm.append("followusername", "${user[0].getUsername()}");
					 					var token = $("meta[name='_csrf']").attr("content");
										var header = $("meta[name='_csrf_header']").attr("content");
										var headers = {};
										headers[header] = token;
					 					$.ajax({
					 						type:'POST',
					 						url:"<@s.url namespace="/" action="delete-follow"/>",
					 						data:oMyForm,
	 										headers: headers,
					 						dataType:'html',
	  										contentType:false,
	 										processData:false,
					 						error:function(){
												alert("发生了一些错误，请稍后再试！");
											},
							 				success:function(){
							                    b1${user[0].getUsername()} = false;
							                    $("#${user[0].getUsername()}followButton").removeClass().addClass("btn btn-info");
							                    $("#${user[0].getUsername()}followButton span").removeClass().addClass("glyphicon glyphicon-plus");
							                    $("#${user[0].getUsername()}followButton b").text("关注");
							                    $("#${user[0].getUsername()}followButton span").css("color","white");
							                    $("#${user[0].getUsername()}followButton b").css("color","white");
							                    b1${user[0].getUsername()} = false;
					 						},
					 					});
	                				}
	                			else {
					 				var oMyForm = new FormData();
					 				oMyForm.append("followusername", "${user[0].getUsername()}");
					 				var token = $("meta[name='_csrf']").attr("content");
									var header = $("meta[name='_csrf_header']").attr("content");
									var headers = {};
									headers[header] = token;
					 				$.ajax({
					 					type:'POST',
					 					url:"<@s.url namespace="/" action="follow"/>",
					 					data:oMyForm,
	 									headers: headers,
					 					dataType:'html',
	  									contentType:false,
	 									processData:false,
					 					error:function(){
											alert("发生了一些错误，请稍后再试！");
										},
					 					success:function(){
					 						if(b2${user[0].getUsername()}){
	                						$("#${user[0].getUsername()}followButton").removeClass().addClass("btn btn-default");
	                						$("#${user[0].getUsername()}followButton span").removeClass().addClass("glyphicon glyphicon-retweet");
	               							$("#${user[0].getUsername()}followButton b").text("互相关注");
	                						$("#${user[0].getUsername()}followButton span").css("color","black");
	                						$("#${user[0].getUsername()}followButton b").css("color","black");
	                 					}
	                 					else{
	                						$("#${user[0].getUsername()}followButton").removeClass().addClass("btn btn-info");
	                						$("#${user[0].getUsername()}followButton span").removeClass().addClass("glyphicon glyphicon-ok");
	                						$("#${user[0].getUsername()}followButton b").text("已关注");
	                						$("#${user[0].getUsername()}followButton span").css("color","white");
	                						$("#${user[0].getUsername()}followButton b").css("color","white");
	                 					}
	                 					b1${user[0].getUsername()} = true;
					 					},
					 				});
	                			}
	            			});
	        			});
	    			</script>
				</div>


</#macro>






<#macro user_card user>

<div class="list-group-item row" style="margin-bottom:10px">
    <div class="col-lg-2 col-md-2 col-sm-3 col-xs-4">
        <a href="<@s.url namespace="/user" action="${user.getUser().getId()}" />" class="thumbnail">
            <img class="img-responsive" src="${user.getUser().getAvatar()}" alt="头像">
        </a>
    </div>
    <div class="col-lg-8 col-md-8 col-sm-7 col-xs-8">
        <h3>${user.getUser().getNickname()}</h3>
        <p><a href="<@s.url action="${user.getUser().getId()}-get-follow" />">关注${user.getUser().getFollowAmount()}</a>      <a href="<@s.url action="${user.getUser().getId()}-get-fans" />">粉丝${user.getUser().getFansAmount()}</a>   <a href="<@s.url namespace="/user" action="${user.getUser().getId()}" />">微博数${user.getUser().getWeiboAmount()}</a></p>
         <p>${user.getUser().getBio()!" "}</p>
    </div>
    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
        <button id="followButton${user.getUser().getId()}" style = "width:90px" class="btn btn-info"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span><b>关注</b></button>
    </div>


	<script type="text/javascript">
		var following${user.getUser().getId()} = ${user.getFollowing()?then('true','false')};
		var followed${user.getUser().getId()} = ${user.getFollower()?then('true','false')};
		$(document).ready(function () {
		if(${user.getIsMe()?then('true','false')}){
			$("#followButton${user.getUser().getId()}").hide();
		}
		if (following${user.getUser().getId()}&&followed${user.getUser().getId()}) {
            $("#followButton${user.getUser().getId()}").removeClass().addClass("btn btn-default");
            $("#followButton${user.getUser().getId()} span").removeClass().addClass("glyphicon glyphicon-retweet");
            $("#followButton${user.getUser().getId()} b").text("互相关注");
            $("#followButton${user.getUser().getId()} span").css("color","black");
            $("#followButton${user.getUser().getId()} b").css("color","black");
	  	}
		else if(following${user.getUser().getId()}){
            $("#followButton${user.getUser().getId()}").removeClass().addClass("btn btn-default");
            $("#followButton${user.getUser().getId()} span").removeClass().addClass("glyphicon glyphicon-ok");
            $("#followButton${user.getUser().getId()} b").text("已关注");
            $("#followButton${user.getUser().getId()} span").css("color","black");
            $("#followButton${user.getUser().getId()} b").css("color","black");
		}
		else{
    		$("#followButton${user.getUser().getId()}").removeClass().addClass("btn btn-info");
    		$("#followButton${user.getUser().getId()} span").removeClass().addClass("glyphicon glyphicon-plus");
    		$("#followButton${user.getUser().getId()} b").text("关注");
    		$("#followButton${user.getUser().getId()} span").css("color","white");
    		$("#followButton${user.getUser().getId()} b").css("color","white");
  		}

  		$("#followButton${user.getUser().getId()}").click(function () {
            	if(following${user.getUser().getId()}){
				 			var oMyForm = new FormData();
				 			oMyForm.append("followusername", "${user.getUser().getUsername()}");
				 			var token = $("meta[name='_csrf']").attr("content");
							var header = $("meta[name='_csrf_header']").attr("content");
							var headers = {};
							headers[header] = token;
				 			$.ajax({
				 				type:'POST',
				 				url:"<@s.url namespce="/" action="delete-follow"/>",
				 				data:oMyForm,
 								headers: headers,
				 				dataType:'html',
  								contentType:false,
 								processData:false,
				 				error:function(){
										alert("发生了一些错误，请稍后再试！");
								},
				 				success:function(){


                    $("#followButton${user.getUser().getId()}").removeClass().addClass("btn btn-info");
                    $("#followButton${user.getUser().getId()} span").removeClass().addClass("glyphicon glyphicon-plus");
                    $("#followButton${user.getUser().getId()} b").text("关注");
                    $("#followButton${user.getUser().getId()} span").css("color","white");
                    $("#followButton${user.getUser().getId()} b").css("color","white");
                    following${user.getUser().getId()} = false;
				 				},
				 			});
				 	}
				 	else{
				 			var oMyForm = new FormData();
				 			oMyForm.append("followusername", "${user.getUser().getUsername()}");
				 			var token = $("meta[name='_csrf']").attr("content");
							var header = $("meta[name='_csrf_header']").attr("content");
							var headers = {};
							headers[header] = token;
				 			$.ajax({
				 				type:'POST',
				 				url:"<@s.url namespace="/" action="follow"/>",
				 				data:oMyForm,
 								headers: headers,
				 				dataType:'html',
  								contentType:false,
 								processData:false,
				 				error:function(){
										alert("发生了一些错误，请稍后再试！");
								},
				 				success:function(){
				 				if(followed${user.getUser().getId()}){
                $("#followButton${user.getUser().getId()}").removeClass().addClass("btn btn-default");
                $("#followButton${user.getUser().getId()} span").removeClass().addClass("glyphicon glyphicon-retweet");
                $("#followButton${user.getUser().getId()} b").text("互相关注");
                $("#followButton${user.getUser().getId()} span").css("color","black");
                $("#followButton${user.getUser().getId()} b").css("color","black");
                 				}
                 				else{

                    				$("#followButton${user.getUser().getId()}").removeClass().addClass("btn btn-default");
                   					 $("#followButton${user.getUser().getId()} span").removeClass().addClass("glyphicon glyphicon-ok");
                  					 $("#followButton${user.getUser().getId()} b").text("已关注");
                				    $("#followButton${user.getUser().getId()} span").css("color","black");
                 					$("#followButton${user.getUser().getId()} b").css("color","black");
                 				}	following${user.getUser().getId()} = true;
				 				},
				 			});

				 	}
  		});
  	});
  	</script>

</div>

</#macro>
