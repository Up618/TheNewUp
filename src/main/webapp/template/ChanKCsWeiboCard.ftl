<#macro weibo_card weibo>
<div class="row">
<div class="media">
  <div class="media-left">
    <a href="<@s.url namespace="/user" action="${weibo.getWeibo().getUser().getId()}" />">
      <img class="media-object" src="${weibo.getWeibo().getUser().getAvatar()}" alt="头像" width="64">
    </a>
  </div>
  <div class="media-body">
    <h4 class="media-heading">${weibo.getWeibo().getUser().getNickname()}</h4>
    <p>${weibo.getWeibo().getTime()}</p>
    <#nested>
  </div>
</div>
</div>
</#macro>