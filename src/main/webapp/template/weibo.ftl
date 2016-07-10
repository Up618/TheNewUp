<#macro weibo_card weibo>
<div class="row" style = "margin-bottom:20px">
  <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
    <a href="<@s.url namespace="/user" action="${weibo.getWeibo().getUser().getId()}" />">
    <img class="img-thumbnail" src="${weibo.getWeibo().getUser().getAvatar()}" alt="头像" width="60">
  </a>//微博头像
</div>
<div class="col-lg-9 col-md-9 col-sm-8 col-xs-8">
  <div class="up-content" style="height: auto">
    <p class="up-sign-nickname">
      <a href="<@s.url namespace="/user" action="${weibo.getUser().getId()}" />">${weibo.getUser().getNickname()}：</a>
    </p>//用户名
    <p class="up-time">${weibo.getTime()}</p>//发布微博时间
    <s><i></i></s>//微博气泡的框
    <p class="up-body">
      <#nested>
    </p>//微博内容
    <hr style="margin-bottom: 10px"/>

    <div class="row up-operat">
      <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
        <p align="center" class="up-operate"><a><span class="glyphicon glyphicon-share" aria-hidden="true"></span> 转发</a></p>
      </div>
      <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
        <p align="center" class="up-operate"><a data-toggle="modal" data-target="#${weibo.getId()}up-comment"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span> 评论</a></p>
      </div>
      <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
        <p align="center" class="up-operate"><a id="${weibo.getId()}agree" href="javascript:agreeit${weibo.getId()}()"><span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>点赞<b>1</b></a></p>
      </div>
    </div>
  </div>
</div>
</div>
</#macro>

</#macro weibo-comment weibo>
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

          <#list  as  >
          <@bootstrap.comment_card weibo=weibo>
          </@bootstrap.comment_card>
          </#list>


      </div>

    </div><!-- /.modal-body -->
  </div><!-- /.modal-content -->
</div><!-- /.modal -->
</div>
</#marco>

<#marco comment_card weibo>
<div>
  <div class="row">
    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" style="text-align: center">
      <a href="<@s.url namespace="/user" action="${weibo.getUser().getId()}" />">
        <img id="${weibo.getId()}comment_img" width = "40" heighth = "40">
      </a>
    </div>
    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 row">
      <p>
        <h id="${weibo.getId()}comment_name"></h><!--评论人名称-->
        <h id="${weibo.getId()}comment_content"></h><!--评论人名称-->
      </p>
      <p id="${weibo.getId()}comment_time" class="col-xs-6 col-sm-6 col-md-6 col-lg-6"></p>

      <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 comment-agree"style="text-align: right">
        <a id="${weibo.getId()}comment_agree" style="display:none" class="btn btn-default btn-xs" href="javascript:agreethecomment${weibo.getId()}()">
          <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
          <b>1</b>
        </a>
      </div>
    </div>
  </div>
</div>
</#marco>

<#marco weibo_card_js>
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
</#marco>
