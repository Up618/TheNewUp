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


    <#if weibo.getWeibo().getPictures().size() gt 0>
    <div class="up-img">
        <img src="${weibo.getWeibo().getPictures().get(0)}"/>
        <a id="zhaowei" data-toggle="modal" data-target="#imgModal" data-whatever="${weibo.getWeibo().getPictures()}" data-picSize="${weibo.getWeibo().getPictures().size()}">
            <span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span>
        </a>
    </div>
    </#if>




    <hr style="margin-bottom: 10px"/>

    <div class="row up-operat">
      <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
        <p align="center" class="up-operate"><a><span class="glyphicon glyphicon-share" aria-hidden="true"></span> 转发</a></p>
      </div>
      <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
        <p align="center" class="up-operate"><a data-toggle="modal" data-target="#up-comment"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span> 评论</a></p>
      </div>
      <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
        <p align="center" class="up-operate"><a id="agree" href="javascript:agreeit()"><span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>点赞<b>1</b></a></p>
      </div>
    </div>
  </div>
</div>
</div>
</#macro>

<#macro weibo_comment>
<div class="modal fade" id="up-comment" tabindex="-1" role="dialog" aria-labelledby="1comment-title" aria-hidden="true">//摸态框头
  <div class="modal-dialog">
    <div class="modal-content">//摸态框内容
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
          &times;
        </button>//摸态框关闭按钮
        <p class="comment-title"></p>//摸态框标题
      </div>
      <div class="modal-body">
        <div class="row" style="margin-left: 0px; margin-right: 0px;">
          <p></p>//请注入微博正文
          <form action="" method="POST">
            <textarea name="content" class="form-control" rows="2" style="resize:none;"
            placeholder="评论..." required></textarea>
            <div style="text-align: right">
              <button type="submit" class="btn btn-primary" style="margin-top: 10px">UP!</button>
            </div>
          </form>

          <hr style="margin-bottom: 10px"/>

        <!--此处放入评论卡片   -->



      </div>

    </div><!-- /.modal-body -->
  </div><!-- /.modal-content -->
</div><!-- /.modal -->
</div>
</#macro>

<#macro comment_card weibo>
<div>
  <div class="row">
    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" style="text-align: center">
      <a href="<@s.url namespace="/user" action="${weibo.getWeibo().getUser().getId()}" />">
        <img id="${weibo.getWeibo().getId()}comment_img" width = "40" heighth = "40">
      </a>
    </div>
    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 row">
      <p>
        <h id="${weibo.getWeibo().getId()}comment_name"></h><!--评论人名称-->
        <h id="${weibo.getWeibo().getId()}comment_content"></h><!--评论人名称-->
      </p>
      <p id="${weibo.getWeibo().getId()}comment_time" class="col-xs-6 col-sm-6 col-md-6 col-lg-6"></p>

      <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 comment-agree"style="text-align: right">
        <a id="${weibo.getWeibo().getId()}comment_agree" style="display:none" class="btn btn-default btn-xs" href="javascript:agreethecomment${weibo.getWeibo().getId()}()">
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

<#macro weibo_pictures_js>
<script>

var sizeOfImg = 0;
function geturl(list) {
  var urlOfImg=new Array()
  if (list.search(/,/) < 0) {
    urlOfImg[0] = list.slice(1,list.search(/]/));
  }
  else {
    urlOfImg[0] = list.slice(1,list.search(/,/));
    list = list.slice(list.search(/,/) + 2);
  }
  for (var i=1; i > 0; i++) {
    if (list.search(/,/) < 0) {
      urlOfImg[i] = list.slice(0,list.search(/]/));
      sizeOfImg = i;
      i = -1;
    }
    else {
      urlOfImg[i] = list.slice(0,list.search(/,/));
      list = list.slice(list.search(/,/) + 2);
    }
  }
  return urlOfImg;
}

var button;
var pageOfImg = 0;
var urls = new Array();

$('#imgModal').on('show.bs.modal', function (event) {
  button = $(event.relatedTarget);
  var recipient = button.data('whatever');

  urls = geturl(recipient);

  $("#modelImg").attr("src", urls[0]);

});

function lastImg() {
  if (pageOfImg > 0){
    pageOfImg = pageOfImg - 1;
    $("#modelImg").attr("src", urls[pageOfImg]);
  }
  else {
    alert("此图为第一张，前翻至最后一张");
    pageOfImg = sizeOfImg;
    $("#modelImg").attr("src", urls[pageOfImg]);
  }
};
function nextImg() {
  if (pageOfImg < sizeOfImg){
    pageOfImg = pageOfImg + 1;
    $("#modelImg").attr("src", urls[pageOfImg]);
  }
  else {
    alert("此图为最后一张，后翻至第一张");
    pageOfImg = 0;
    $("#modelImg").attr("src", urls[pageOfImg]);
  }
};
</script>
</#macro>
