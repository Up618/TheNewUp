<#import "/template/bootstrap.ftl" as bootstrap>
<html style="position:relative;min-height:100%;">
<@bootstrap.head title="关注"></@bootstrap.head>
<@bootstrap.body>
<div class="container" style="padding-top:60px">

<div class="row">


	<div class="row col-lg-9">
		<div class="col-sm-3 col-md-3 col-lg-3">
		</div>
		<div class="col-sm-9 col-md-9 col-lg-9">
			<h5>全部关注：${followAmount}</h5>
			<div class="list-group">
				<#list users as user>

<div id="${user[0].getUsername()}card" class="list-group-item row">
    <div class="col-lg-2 col-md-2 col-sm-3 col-xs-4">
        <a href="<@s.url namespace="/user" action="${user[0].getId()}" />" class="thumbnail">
            <img class="img-responsive" src="${user[0].getAvatar()}" alt="头像">
        </a>
    </div>
    <div class="col-lg-8 col-md-8 col-sm-7 col-xs-8">
        <h3>${user[0].getNickname()}</h3>
        <p><a href="<@s.url action="${user[0].getId()}-get-follow" />">关注${user[0].getFollowAmount()}</a>      <a href="<@s.url action="${user[0].getId()}-get-fans" />">粉丝${user[0].getFansAmount()}</a>   微博数<a href="<@s.url namespace="/user" action="${user[0].getId()}" />">${user[0].getWeiboAmount()}</a></p>
         <p>${user[0].getSignature()!" "}</p>
    </div>
    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
        <button id="${user[0].getUsername()}followButton" style = "width:90px" class="btn btn-info"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span><b>关注</b></button>
    </div>
    <script type="text/javascript">
        var b1${user[0].getUsername()} = ${user[1]};     
        var b2${user[0].getUsername()} = ${user[2]};                   //这地方写是否关注
        $(document).ready(function () {
            if (b1${user[0].getUsername()}&&b2${user[0].getUsername()}) {
                $("#${user[0].getUsername()}followButton").removeClass().addClass("btn btn-default");
                $("#${user[0].getUsername()}followButton span").removeClass().addClass("glyphicon glyphicon-retweet");
                $("#${user[0].getUsername()}followButton b").text("互相关注");
                $("#${user[0].getUsername()}followButton span").css("color","black");
                $("#${user[0].getUsername()}followButton b").css("color","black");
            }
            else if(b2${user[0].getUsername()}){
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
            	if(b2${user[0].getUsername()}){
				 			var oMyForm = new FormData();
				 			oMyForm.append("followusername", "${user[0].getUsername()}");
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
                    b2${user[0].getUsername()} = false;
                    
>>>>>>> branch 'master' of https://github.com/Up618/TheNewUp.git
                    $("#${user[0].getUsername()}followButton").removeClass().addClass("btn btn-info");
                    $("#${user[0].getUsername()}followButton span").removeClass().addClass("glyphicon glyphicon-plus");
                    $("#${user[0].getUsername()}followButton b").text("关注");
                    $("#${user[0].getUsername()}followButton span").css("color","white");
                    $("#${user[0].getUsername()}followButton b").css("color","white");
				 					alert(	"已取消关注");

				 				},
				 			});
				 	}
				 	else{

                    ${user[0].getUsername()}follow = true;
				 			var oMyForm = new FormData();
				 			oMyForm.append("followusername", "${user[0].getUsername()}");
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
				 				if(b1${user[0].getUsername()}){
                $("#${user[0].getUsername()}followButton").removeClass().addClass("btn btn-default");
                $("#${user[0].getUsername()}followButton span").removeClass().addClass("glyphicon glyphicon-retweet");
                $("#${user[0].getUsername()}followButton b").text("互相关注");
                $("#${user[0].getUsername()}followButton span").css("color","black");
                $("#${user[0].getUsername()}followButton b").css("color","black");
                 				}
                 				else{
<<<<<<< HEAD
                 				
                $("#${user[0].getUsername()}followButton").removeClass().addClass("btn btn-info");
                $("#${user[0].getUsername()}followButton span").removeClass().addClass("glyphicon glyphicon-ok");
                $("#${user[0].getUsername()}followButton b").text("已关注");
                $("#${user[0].getUsername()}followButton span").css("color","white");
                $("#${user[0].getUsername()}followButton b").css("color","white");
                 				}	
                 				
                    b2${user[0].getUsername()} = true;

				 					alert(	"已成功关注");
				 				},
				 			});

				 	}


            });
        });
    </script>
</div>

					<#else>
					<h1>你还没有关注任何人哦！</h1>
				</#list>
			</div>
		</div>
	</div>
	</div>
</div>
</@bootstrap.body>
</html>
