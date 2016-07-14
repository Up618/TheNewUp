<#import "/template/bootstrap.ftl" as bootstrap>
<html style="position:relative;min-height:100%;">

<@bootstrap.head title="登录">
<link href="http://o9x8azwl1.bkt.clouddn.com/signin&up.css" rel="stylesheet">
</@bootstrap.head>

<body>
  <div class="container" style="padding-top:40px">
    <div class="form-sign">
      <div style="height: 40px">
        <ul class="sign-inup">  <!--nav nav-tabs -->
          <li role="presentation" class="active sign-in"><a href="javascript:showIn()">登录</a></li>
          <li role="presentation" class="sign-up"><a href="javascript:showUp()">注册</a></li>
        </ul></div>
        <div class="form-sign-body">
          <form id="in" action="./login" method="post">
            <label class="sr-only" for="Username">Username</label>
            <input type="text" class="form-control" id="signin-username" name="username" placeholder="用户名" required>
            <label class="sr-only" for="Password">Password</label>
            <input type="password" class="form-control" id="signin-password" name="password" placeholder="密码" required>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <p class="warning-span" id="signin-warning"><span class="glyphicon glyphicon-remove" aria-hidden="true" style="float: left;"></span></p>
            <p class="warning-p" id="signin-text" >账号或密码错误</p>


            <button class="btn btn-lg btn-primary btn-block sign-inup-button" onclick="signincheck()">登录</button>

            <script>
            function signincheck()
            {
              if ($("#signin-username").val() == "") {
                $("#signin-warning").show();
                $("#signin-text").text("请输入用户名").show();
                $("#signup-password").val("");
              }
              else if ($("#signin-password").val() == "") {
                $("#signin-warning").show();
                $("#signin-text").text("请输入密码").show();
              }

              else $("#in").submit();
            }
            </script>
          </form>
          <form id="up" action="./register" method="post" style="display:none;">
            <label class="sr-only" for="Username">Username</label>
            <input type="text" class="form-control" id="signup-username" name="username" placeholder="用户名" required>
            <label class="sr-only" for="Username">Username</label>
            <input type="text" class="form-control" id="signup-nickname" name="nickname" placeholder="昵称" required>
            <label class="sr-only" for="Password">Password</label>
            <input type="password" class="form-control" id="signup-password" name="password" placeholder="密码" required>
            <label class="sr-only" for="Password">Password</label>
            <input type="password" class="form-control" id="signup-passwordagain" name="passwordAgain" placeholder="请再次输入密码" required>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <p class="warning-span" id="signup-warning"><span class="glyphicon glyphicon-remove" aria-hidden="true" style="float: left"></span></p>
            <p class="warning-p" id="signup-text"></p>

            <button class="btn btn-lg btn-primary btn-block sign-inup-button" onclick="signupcheck()">注册</button>

            <script>
            function signupcheck()
            {
              var memberPass = /^(?=.*[0-9].*)(?=.*[a-zA-Z].*).{6,20}$/;
              var numPass = /^[0-9]+$/;

              $("#signup-warning").hide();
              $("#signup-text").hide();

              if ($("#signup-username").val() == "") {
                $("#signup-warning").show();
                $("#signup-text").text("请输入用户名").show();
                $("#signup-password").val("");
                $("#signup-passwordagain").val("");
              }
              else if ($("#signup-nickname").val() == "") {
                $("#signup-warning").show();
                $("#signup-text").text("请输入昵称").show();
              }
              else if ($("#signup-password").val() == "") {
                $("#signup-warning").show();
                $("#signup-text").text("请输入密码").show();
                $("#signup-passwordagain").val("");
              }
              else if(numPass.test($("#signup-password").val())){
                $("#signup-warning").show();
                $("#signup-text").text("请不要用纯数字做密码").show();
                $("#signup-password").val("");
                $("#signup-passwordagain").val("");
              }
              else if (!(memberPass.test($("#signup-password").val()))) {
                $("#signup-warning").show();
                $("#signup-text").text("密码必须为6-20字符的字母数字组合").show();
                $("#signup-password").val("");
                $("#signup-passwordagain").val("");
              }
              else if ($("#signup-passwordagain").val() == "") {
                $("#signup-warning").show();
                $("#signup-text").text("请再次输入密码").show();
              }
              else if ($("#signup-password").val() != $("#signup-passwordagain").val()) {
                $("#signup-warning").show();
                $("#signup-text").text("两次密码输入不一致").show();
                $("#signup-password").val("");
                $("#signup-passwordagain").val("");
              }

              else{
                $.ajax({
                  url:"api/username-valid",
                  data:{username:$("#signup-username").val()},
                  async:false
                }).done(function(data){
                  if(!data.valid){
                    $("#signup-warning").show();
                    $("#signup-text").text("用户名已被注册").show();
                    $("#signup-password").val("");
                    $("#signup-passwordagain").val("");
                  }
                }).fail(function(){
                  $("#signup-warning").show();
                  $("#signup-text").text("网络错误").show();
                  $("#signup-password").val("");
                  $("#signup-passwordagain").val("");
                });
                $.ajax({
                  url:"api/nickname-valid",
                  data:{nickname:$("#signup-nickname").val()},
                  async:false
                }).done(function(data){
                  if(!data.valid){
                    $("#signup-warning").show();
                    $("#signup-text").text("昵称已被注册").show();
                    $("#signup-password").val("");
                    $("#signup-passwordagain").val("");
                  }
                }).fail(function(){
                  $("#signup-warning").show();
                  $("#signup-text").text("网络错误").show();
                  $("#signup-password").val("");
                  $("#signup-passwordagain").val("");
                });
                if($("#signup-password").val()!= ""){
                  $("#up").submit();
                }
              }
            }
            </script>
          </form>
        </div>
      </div>
    </div>
  </body>
  <script>



  $(document).ready(function () {
    <#if Parameters["error"]??>
    $("#signin-warning").show();
    $("#signin-text").show();
    </#if>
  });

  function showIn() {
    $("#up").hide();
    $("#in").show();
    $(".form-sign ul li:eq(1)").removeClass("active");
    $(".form-sign ul li:eq(0)").addClass("active");
  }
  ;
  function showUp() {
    $("#up").show();
    $("#in").hide();
    $(".form-sign ul li:eq(0)").removeClass("active");
    $(".form-sign ul li:eq(1)").addClass("active");
  }
  ;
  </script>
  <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
  <!-- Latest compiled and minified JavaScript -->
  <script src="https://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

  </html>
