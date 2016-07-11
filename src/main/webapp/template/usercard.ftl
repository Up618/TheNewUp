<#import "/template/bootstrap.ftl" as bootstrap>
<#macro user_card_lg user>
<div style="text-align:center;">
	<div class="thumbnail userCard">
		<img class="img-thumbnail" src="${user.getUser().getAvatar()}" alt="头像" alt="头像" height="120" width="120">
		<h2>${user.getUser().getNickname()}</h2>
		<p>${user.getUser().getSignature()!" "}</p>
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
				 				url:"<@s.url action="delete-follow"/>",
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
				 					alert(	"已取消关注");
				 					
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
				 				url:"<@s.url action="follow"/>",
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
				 					alert(	"已成功关注");
				 				},
				 			});
                    
				 	}
  		});
  	});
  	</script>
  </div>
  </#macro>