<#macro weibo_card weibo>
<div class="row" style = "margin-bottom:20px">
<div class="col-lg-10 col-md-10 col-sm-10 col-xs-9 col-lg-offset-2 col-md-offset-2 col-sm-offset-2 col-xs-offset-3">
  <a class="weiboCardAvatar" href="<@s.url namespace="/user" action="${weibo.getWeibo().getUser().getId()}" />" style="top: 0px; left: -70px; display: block; position: absolute;">
    <img class="" src="${weibo.getWeibo().getUser().getAvatar()}" alt="头像" width="60">
  </a><!--微博头像-->
  <div class="up-content" style="height: auto">
    <p class="up-sign-nickname">
      <a href="<@s.url namespace="/user" action="${weibo.getWeibo().getUser().getId()}" />">${weibo.getWeibo().getUser().getNickname()}：</a>
    </p>
    <p class="up-time">${weibo.getWeibo().getTime()}</p>
    <s><i></i></s>
    <p class="up-body">
      <#nested>
    </p>
    <hr style="margin-bottom: 10px"/>

    <div class="row up-operat">
      <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
        <p align="center" class="up-operate"><a style="color:gray;"><span class="glyphicon glyphicon-share" aria-hidden="true"></span> 转发</a></p>
      </div>
      <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
        <p align="center" class="up-operate"><a id="${weibo.getWeibo().getId()}" class = "comment_show" style="color:gray;"><span class="glyphicon glyphicon-edit" aria-hidden="true" style="color:gray;"></span>评论</a></p></div>
      <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
        <p align="center" class="up-operate">
        	<a id="${weibo.getWeibo().getId()}agree" href="#${weibo.getWeibo().getId()}" style="color:gray;">
        		<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"/>
        		点赞<b>${weibo.getWeibo().getAgreeAmount()}</b>
        	</a>
        </p>
      </div>
<script>
$(document).ready(function () {
	//判断按钮样式
	var iliked${weibo.getWeibo().getId()} = ${weibo.getiLike()?then('true','false')};
	if(iliked${weibo.getWeibo().getId()}){
        $("#${weibo.getWeibo().getId()}agree").css("color", "red");
        $("#${weibo.getWeibo().getId()}agree").mouseover(function(){$("#${weibo.getWeibo().getId()}agree").css("color", "gray");});
        $("#${weibo.getWeibo().getId()}agree").mouseout(function(){$("#${weibo.getWeibo().getId()}agree").css("color", "red");});
      }//if
    else {
        $("#${weibo.getWeibo().getId()}agree").css("color", "gray");
        $("#${weibo.getWeibo().getId()}agree").mouseover(function(){$("#${weibo.getWeibo().getId()}agree").css("color", "red");});
        $("#${weibo.getWeibo().getId()}agree").mouseout(function(){$("#${weibo.getWeibo().getId()}agree").css("color", "gray");});
    }//else
	
	//点击触发点赞操作
  $("#${weibo.getWeibo().getId()}agree").click(function(){
  	//alert("clicked");
    //function agreeit(){
    //alert("agreeit");
    var token = $("meta[name='_csrf']").attr("content"); //之前已经把对应的变量存入<head>的<meta>中
    var header = $("meta[name='_csrf_header']").attr("content");
    var headers = {};
    headers[header] = token;
    $.ajax({
      type: 'POST',
      dataType:'json',
      headers: headers,
      url: "<@s.url namespace="/agree" action="agree"><@s.param name="weibo_id" value="${weibo.getWeibo().getId()}"/> </@s.url>",
      //传一个微博id的param到后台
    }).done(function (data) {
      //alert(data.ifLiked);
      //判断按钮样式
      if (!data.ifLiked) {
        $("#${weibo.getWeibo().getId()}agree b").text(parseInt($("#${weibo.getWeibo().getId()}agree b").text()) + 1);
        iliked${weibo.getWeibo().getId()} = true;
        $("#${weibo.getWeibo().getId()}agree").css("color", "red");
        $("#${weibo.getWeibo().getId()}agree").mouseover(function () { $("#${weibo.getWeibo().getId()}agree").css("color", "gray"); });
        $("#${weibo.getWeibo().getId()}agree").mouseout(function () { $("#${weibo.getWeibo().getId()}agree").css("color", "red"); });
      }//if
      else {
        $("#${weibo.getWeibo().getId()}agree b").text(parseInt($("#${weibo.getWeibo().getId()}agree b").text()) - 1);
        iliked${weibo.getWeibo().getId()} = false;
        $("#${weibo.getWeibo().getId()}agree").css("color", "gray");
        $("#${weibo.getWeibo().getId()}agree").mouseover(function () { $("#${weibo.getWeibo().getId()}agree").css("color", "red"); });
        $("#${weibo.getWeibo().getId()}agree").mouseout(function () { $("#${weibo.getWeibo().getId()}agree").css("color", "gray"); });
      }//else
    }) //done
  //} //agreeit
  }); //click
}); //document.ready
</script>
    </div>
  </div>
</div>
</div>
</#macro>

<#macro weibo_comment>
<div class="modal fade" id="up-comment" tabindex="-1" role="dialog" aria-labelledby="1comment-title" aria-hidden="true"><!--摸态框头-->
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
          &times;
        </button>
        <p class="comment-title">微博评论</p><!--摸态框标题-->
        <h id = "wid_comment" aria-hidden="true"></h>
      </div>
      <div class="modal-body">
        <div class="row" style="margin-left: 0px; margin-right: 0px;">
          <p id = "wc"></p><!--微博正文-->
            <textarea id="input_content" class="form-control" rows="2" style="resize:none;" placeholder="评论..." required>
            </textarea>
            <div style="text-align: right">
              <button id = "comment_input" type="submit" class="btn btn-primary" style="margin-top: 10px">评论</button>
            </div>

          <hr style="margin-bottom: 10px"/>

                <!--此处放入评论卡片   -->
                
                
                
                <div id="container"></div>
                
        
        
  <div>

<div class="row">  
     <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" style="text-align: center">
      <a href="<@s.url namespace="/user" action="1"/>">
        <img id="1comment_img" width = "40" heighth = "40">
      </a>
    </div>
    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 row">
      <p>
      
        <h id="1comment_name"></h><!--评论人名称-->
        
        <h id="1comment_content"></h><!--评论内容-->
        
        <h id = "1cid_agree" aria-hidden="true"></h>  <!--评论的id-->
        
      </p>
      <p id="1comment_time" class="col-xs-6 col-sm-6 col-md-6 col-lg-6"></p>

      <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 comment-agree"style="text-align: right">
        <a id="1comment_agree" style="display:none" class="btn btn-default btn-xs" href="javascript:agreethecomment1()">
          <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
          <b>1</b>
        </a>
      </div>   
    </div>
  </div>
  
  
  
  <!------------------------------下面是第二条评论--------------------------------------------->
  <div class="row">  
  <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" style="text-align: center">
      <a href="<@s.url namespace="/user" action="1"/>">
        <img id="2comment_img" width = "40" heighth = "40">
      </a>
    </div>
    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 row">
      <p>
      
        <h id="2comment_name"></h><!--评论人名称-->
        
        <h id="2comment_content"></h><!--评论内容-->
        
        <h id = "2cid_agree" aria-hidden="true"></h>  <!--评论的id-->
      </p>
      <p id="2comment_time" class="col-xs-6 col-sm-6 col-md-6 col-lg-6"></p>

      <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 comment-agree"style="text-align: right">
        <a id="2comment_agree" style="display:none" class="btn btn-default btn-xs" href="javascript:agreethecomment2()">
          <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
          <b>1</b>
        </a>
      </div>   
    </div>
  </div>                 
<!------------------------------上面是第二条评论--------------------------------------------->   

<!------------------------------下面是第三条评论--------------------------------------------->
  <div class="row">  
  <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" style="text-align: center">
      <a href="<@s.url namespace="/user" action="1"/>">
        <img id="3comment_img" width = "40" heighth = "40">
      </a>
    </div>
    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 row">
      <p>
      
        <h id="3comment_name"></h><!--评论人名称-->
        
        <h id="3comment_content"></h><!--评论内容-->
        
        <h id = "3cid_agree" aria-hidden="true"></h>  <!--评论的id-->
      </p>
      <p id="3comment_time" class="col-xs-6 col-sm-6 col-md-6 col-lg-6"></p>

      <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 comment-agree"style="text-align: right">
        <a id="3comment_agree" style="display:none" class="btn btn-default btn-xs" href="javascript:agreethecomment3()">
          <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
          <b>1</b>
        </a>
      </div>   
    </div>
  </div>                 
<!------------------------------上面是第三条评论--------------------------------------------->

<!------------------------------下面是第四条评论--------------------------------------------->
  <div class="row">  
  <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" style="text-align: center">
      <a href="<@s.url namespace="/user" action="1"/>">
        <img id="4comment_img" width = "40" heighth = "40">
      </a>
    </div>
    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 row">
      <p>
      
        <h id="4comment_name"></h><!--评论人名称-->
        
        <h id="4comment_content"></h><!--评论内容-->
        
        <h id = "4cid_agree" aria-hidden="true"></h>  <!--评论的id-->
      </p>
      <p id="4comment_time" class="col-xs-6 col-sm-6 col-md-6 col-lg-6"></p>

      <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 comment-agree"style="text-align: right">
        <a id="4comment_agree" style="display:none" class="btn btn-default btn-xs" href="javascript:agreethecomment4()">
          <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
          <b>1</b>
        </a>
      </div>   
    </div>
  </div>                 
<!------------------------------上面是第四条评论---------------------------------------------> 

<!------------------------------下面是第五条评论--------------------------------------------->
  <div class="row">  
  <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" style="text-align: center">
      <a href="<@s.url namespace="/user" action="1"/>">
        <img id="5comment_img" width = "40" heighth = "40">
      </a>
    </div>
    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 row">
      <p>
      
        <h id="5comment_name"></h><!--评论人名称-->
        
        <h id="5comment_content"></h><!--评论内容-->
        
        <h id = "5cid_agree" aria-hidden="true"></h>  <!--评论的id-->
      </p>
      <p id="5comment_time" class="col-xs-6 col-sm-6 col-md-6 col-lg-6"></p>

      <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 comment-agree"style="text-align: right">
        <a id="5comment_agree" style="display:none" class="btn btn-default btn-xs" href="javascript:agreethecomment5()">
          <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
          <b>1</b>
        </a>
      </div>   
    </div>
  </div>                 
<!------------------------------上面是第五条评论--------------------------------------------->     
     

  
</div>



      </div>

    </div><!-- /.modal-body -->
  </div><!-- /.modal-content -->
</div><!-- /.modal -->
</div>
</#macro>


<#macro weibo_card_js>
<script>
$('#up-comment').on('show.bs.modal', function (event) {
  var weibo = $(event.relatedTarget) // Button that triggered the modal
  alert(weibo);
  var recipient = weibo.data('whatever') // Extract info from data-* attributes
  alert(recipient);
  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
  var modal = $(this)
  modal.find('.comment-title').text('这是' + recipient + "的评论")
})
</script>
</#macro>

<#macro weibo_comment_card_js>
<!--评论的获取函数-->
      <script type="text/javascript">
      $(document).ready(function () {
      $(".comment_show").click(function(){
                	var par = $(this).attr("id");
                	
                	$("#up.comment").modal();
                	
                	$("#input_content").text("");
                	for(var j=0;j<5;j++){  
                          var ind = j+1;
                          
                          var tag_name_null = "#"+ind+"comment_name";
                	      var tag_content_null = "#"+ind+"comment_content";
                	      var tag_time_null = "#"+ind+"comment_time";
                	      var tag_avatar_null = ""+ind+"comment_img";
                	      var tag_agree_null = "#"+ind+"comment_agree";
                	      
                	      $(tag_name_null).text("");
                	      $(tag_content_null).text("");
                	      $(tag_time_null).text("");
                	      $(tag_agree_null).hide();
                	      document.getElementById(tag_avatar_null).style.visibility="hidden";
                        }
                        
                	    var self = this;
                        self.json = ko.observable();
                        self.par = ko.observableArray();
                	    $.ajax({
                		    type: 'GET',
                            url: "<@s.url namespace="/comment" action="comment"/>",
                	        data: {weibo_id: par},
                	    }).done(function (data) {
                        var obj = eval('(' + data.json + ')');
                        
                        
                        for(var i=0,l=obj.length;i<l;i++){  
                          var index = i+1;
                          var tag_name = "#"+index+"comment_name";
                	      var tag_content = "#"+index+"comment_content";
                	      var tag_time = "#"+index+"comment_time";
                	      var tag_avatar = ""+index+"comment_img";
                	      var tag_agree = "#"+index+"comment_agree";
                	      var tag_cid_agree = ""+index+"cid_agree";
                	      
                	      document.getElementById(tag_cid_agree).value = obj[i]["id"];
                	      var a = document.getElementById(tag_cid_agree).value;//评论的id
                	      
                	      $(tag_name).text(obj[i]["nickname"]+"：");
                	      $(tag_agree).show();
                          
                          if(obj[i]["content"]!=null){
                	        $(tag_content).text(obj[i]["content"]);
                	      }
                	      if(obj[i]["time"]){
                	        $(tag_time).text(obj[i]["time"]);
                	      }
                	      if(obj[i]["avatar"]!=null){
                	        document.getElementById(tag_avatar).style.visibility="visible";
                	        document.getElementById(tag_avatar).src=obj[i]["avatar"];
                	      } 
                	    }
                	    self.json(data.json);
                	    }) //done
                	});//click  
                }); //document.ready
</script>
</#macro>

<#macro weibo_comment_submit_js>
<script type="text/javascript">
//评论的输入函数
function comment_input_js(){
                	$("#comment_input").click(function(){
                	 var weibo_id = document.getElementById("wid_comment").value;
                	 var content = document.getElementById("input_content").value;
                	 
                	 document.getElementById("input_content").value ="";
                	    $.ajax({
                		    type: 'GET',
                            url: "<@s.url namespace="/comment" action="inputComment"/>",
                	        data: {weibo_id: weibo_id, content: content},
                	    }).done(function (data) {    
                	    for(var j=0;j<5;j++){  
                          var ind = j+1;
                          
                          var tag_name_null = "#"+ind+"comment_name";
                	      var tag_content_null = "#"+ind+"comment_content";
                	      var tag_time_null = "#"+ind+"comment_time";
                	      var tag_avatar_null = ""+ind+"comment_img";
                	      var tag_agree_null = "#"+ind+"comment_agree";
                	      
                	      $(tag_name_null).text("");
                	      $(tag_content_null).text("");
                	      $(tag_time_null).text("");
                	      $(tag_agree_null).hide();
                	      document.getElementById(tag_avatar_null).style.visibility="hidden";
                        }
                	    var self = this;
                        self.json = ko.observable();
                        self.par = ko.observableArray();
                	    $.ajax({
                		    type: 'GET',
                            url: "<@s.url namespace="/comment" action="comment"/>",
                	        data: {weibo_id: weibo_id},
                	    }).done(function (data) {
                        var obj = eval('(' + data.json + ')');
                        for(var i=0,l=obj.length;i<l;i++){ 
                        var index = i+1;
                          var tag_name = "#"+index+"comment_name";
                	      var tag_content = "#"+index+"comment_content";
                	      var tag_time = "#"+index+"comment_time";
                	      var tag_avatar = ""+index+"comment_img";
                	      var tag_agree = "#"+index+"comment_agree";
                	      
                	      var tag_cid_agree = ""+index+"cid_agree";
                	      document.getElementById(tag_cid_agree).value = obj[i]["id"];
                	      var a = document.getElementById(tag_cid_agree).value;//评论的id
                	      
                	      $(tag_name).text(obj[i]["nickname"]+"：");
                	      $(tag_agree).show();
                          
                          if(obj[i]["content"]!=null){
                	        $(tag_content).text(obj[i]["content"]);
                	      }
                	      if(obj[i]["time"]){
                	        $(tag_time).text(obj[i]["time"]);
                	      }
                	      if(obj[i]["avatar"]!=null){
                	        document.getElementById(tag_avatar).style.visibility="visible";
                	        document.getElementById(tag_avatar).src=obj[i]["avatar"];
                	      } 
                	    }
                	    self.json(data.json);
                	    }) //done
                	    }) //done
                    });
                    }
</script>
</#macro>