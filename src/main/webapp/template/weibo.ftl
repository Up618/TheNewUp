<#assign weibo_for_comment_id = 1>

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
    <#assign weibo_for_comment_id = "${weibo.getWeibo().getId()}">
    <p class="up-time">${weibo.getWeibo().getTime()}</p>
    <s><i></i></s>
    <p class="up-body">
      <#nested>
    </p>
    <hr style="margin-bottom: 10px"/>

    <div class="row up-operat">
      <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
        <p align="center" class="up-operate"><a><span class="glyphicon glyphicon-share" aria-hidden="true"></span> 转发</a></p>
      </div>
      <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
        <p align="center" class="up-operate"><a id="${weibo.getWeibo().getId()}" data-toggle="modal" data-target="#up-comment" class = "comment_show"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span> 评论</a></p></div>
      <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
        <p align="center" class="up-operate"><a id="agree" href="javascript:agreeit()"><span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>点赞<b>1</b></a></p>
      </div>
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
        <p class="comment-title"></p><!--摸态框标题-->
      </div>
      <div class="modal-body">
        <div class="row" style="margin-left: 0px; margin-right: 0px;">
          <p></p><!--微博正文-->
            <textarea id="input_content" class="form-control" rows="2" style="resize:none;" placeholder="评论..." required>
            </textarea>
            <div style="text-align: right">
              <button id = "comment_input" type="submit" class="btn btn-primary" style="margin-top: 10px">评论</button>
            </div>

          <hr style="margin-bottom: 10px"/>

                <!--此处放入评论卡片   -->
        
        
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

  
</div>



      </div>

    </div><!-- /.modal-body -->
  </div><!-- /.modal-content -->
</div><!-- /.modal -->
</div>
</#macro>

<#macro comment_card>
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

<script>

//$(document).ready(function () {
  //$("#agreeit").click(function(){
    function agreeit(){
    var token = $("meta[name='_csrf']").attr("content"); //之前已经把对应的变量存入<head>的<meta>中
    var header = $("meta[name='_csrf_header']").attr("content");
    var headers = {};
    headers[header] = token;
    $.ajax({
      type: 'POST',
      dataType:'json',
      headers: headers,
      <#--url: "<@s.url namespace="/agree" action="agree"><@s.param name="weibo_id" value="${weibo.getWeibo().getId()}"/> </@s.url>",-->
      //传一个微博id的param到后台
    }).done(function (data) {
      //alert(data.ifLiked);
      //判断按钮样式
      if (!data.ifLiked) {
        $("#agree b").text(parseInt($("#agree b").text()) + 1);
        agree = true;
        $("#agree").css("color", "red");
        $("#agree").mouseover(function () {
          $("#agree").css("color", "black");
        });
        $("#agree").mouseout(function () {
          $("#agree").css("color", "red");
        });
      }//if
      else {
        $("#agree b").text(parseInt($("#agree b").text()) - 1);
        agree = false;
        $("#agree").css("color", "black");
        $("#agree").mouseover(function () {
          $("#agree").css("color", "red");
        });
        $("#agree").mouseout(function () {
          $("#agree").css("color", "black");
        });
      }//else
    }) //done
  }
  //}); //click
//}); //document.ready

</script>
</#macro>


<#macro weibo_comment_card_js>
<!--评论的获取函数-->
      <script type="text/javascript">
      $(document).ready(function () {
      $(".comment_show").click(function(){
                	var par = $(this).attr("id");
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
                	      
                	      $(tag_name).text(obj[i]["nickname"]+"：");
                	      $(tag_agree).show();
                          
                          if(obj[i]["content"]!=null){
                	        $(tag_content).text(obj[i]["content"]);
                	      }
                	      if(obj[i]["time"]){
                	        $(tag_time).text(obj[i]["time"]);
                	      }
                	      if(obj[i]["avatar"]!=null){
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
$(document).ready(function () {
                	$("#comment_input").click(function(){
                	 var weibo_id ="${weibo_for_comment_id?js_string}";
                	 alert("weibo_id"+weibo_id);
                	 var content = document.getElementById("input_content").value;
                	 document.getElementById("input_content").value = "";
                	    $.ajax({
                		    type: 'GET',
                            url: "<@s.url namespace="/comment" action="inputComment"/>",
                	        data: {weibo_id: weibo_id, content: content},
                	    }).done(function (data) {    
                	    //var par = $(this).attr("id");
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
                	      
                	      $(tag_name).text(obj[i]["nickname"]+"：");
                	      $(tag_agree).show();
                          
                          if(obj[i]["content"]!=null){
                	        $(tag_content).text(obj[i]["content"]);
                	      }
                	      if(obj[i]["time"]){
                	        $(tag_time).text(obj[i]["time"]);
                	      }
                	      if(obj[i]["avatar"]!=null){
                	        document.getElementById(tag_avatar).src=obj[i]["avatar"];
                	      } 
                	    }
                	    self.json(data.json);
                	    }) //done
                	    	//测试！！！！！！！！！！！！！！！！！！！！！！
                	    }) //done
                    }); //click   
                }); //document.ready
</script>
</#macro>