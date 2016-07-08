<#import "/template/bootstrap.ftl" as bootstrap>
<html style="position:relative;min-height:100%;">
<@bootstrap.head title="个人首页"></@bootstrap.head>
<@bootstrap.body>

<div class="modal fade" id="imgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <img id="modelImg" src="">
         </div>
    </div>
</div>

<div class="container" style="padding-top:60px">
	<div class="row">
		<@bootstrap.user_card_lg user=user />
	</div>



	<div class="row">
		<div class="col-md-3 col-sm-3 col-lg-3">
			
		</div>
		<div class="col-md-9 col-sm-9 col-lg-9">
			<#list weibos as weibo>
				<@bootstrap.weibo_card weibo=weibo>
					${weibo.getContent()}
				</@bootstrap.weibo_card>
			</#list>
		</div>
	</div>
<script style="text/javascript">

                            function setImgSize(imgId, times, imgUrl) {
                                $(imgId).height($("#firstWeiboImg").innerWidth() * times);
                                $(imgId).width($("#firstWeiboImg").innerWidth() * times);
                                $(imgId).attr("src", imgUrl);
                            }


                            var nubOfImg = 4;                                //这里写图片数量
                            $(document).ready(function () {
                                switch (nubOfImg) {
                                    case 0:
                                        break;
                                    case 1:
                                        setImgSize("#firWeiboFirstImg", 0.6, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        break;
                                    case 2:
                                        setImgSize("#firWeiboFirstImg", 0.5, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        setImgSize("#secWeiboFirstImg", 0.5, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        break;
                                    case 3:
                                        setImgSize("#firWeiboFirstImg", 0.66, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        setImgSize("#secWeiboFirstImg", 0.34, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        setImgSize("#thiWeiboFirstImg", 0.34, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        break;
                                    case 4:
                                        setImgSize("#firWeiboFirstImg", 0.5, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        setImgSize("#secWeiboFirstImg", 0.5, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        setImgSize("#thiWeiboFirstImg", 0.5, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        setImgSize("#fouWeiboFirstImg", 0.5, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        break;
                                    case 5:
                                        setImgSize("#firWeiboFirstImg", 0.5, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        setImgSize("#secWeiboFirstImg", 0.5, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        setImgSize("#thiWeiboFirstImg", 0.33, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        setImgSize("#fouWeiboFirstImg", 0.33, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        setImgSize("#fivWeiboFirstImg", 0.34, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        break;
                                    case 6:
                                        setImgSize("#firWeiboFirstImg", 0.66, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        setImgSize("#secWeiboFirstImg", 0.34, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        setImgSize("#thiWeiboFirstImg", 0.34, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        setImgSize("#fouWeiboFirstImg", 0.33, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        setImgSize("#fivWeiboFirstImg", 0.33, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        setImgSize("#sixWeiboFirstImg", 0.34, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        break;
                                    case 7:
                                        setImgSize("#firWeiboFirstImg", 0.66, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        setImgSize("#secWeiboFirstImg", 0.33, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        setImgSize("#thiWeiboFirstImg", 0.33, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        setImgSize("#fouWeiboFirstImg", 0.25, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        setImgSize("#fivWeiboFirstImg", 0.25, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        setImgSize("#sixWeiboFirstImg", 0.25, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        setImgSize("#sevWeiboFirstImg", 0.25, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        break;
                                    case 8:
                                        setImgSize("#firWeiboFirstImg", 0.75, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        setImgSize("#secWeiboFirstImg", 0.25, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        setImgSize("#thiWeiboFirstImg", 0.25, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        setImgSize("#fouWeiboFirstImg", 0.25, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        setImgSize("#fivWeiboFirstImg", 0.25, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        setImgSize("#sixWeiboFirstImg", 0.25, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        setImgSize("#sevWeiboFirstImg", 0.25, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        setImgSize("#eigWeiboFirstImg", 0.25, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        break;
                                    case 9:
                                        setImgSize("#firWeiboFirstImg", 0.33, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        setImgSize("#secWeiboFirstImg", 0.33, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        setImgSize("#thiWeiboFirstImg", 0.33, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        setImgSize("#fouWeiboFirstImg", 0.33, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        setImgSize("#fivWeiboFirstImg", 0.33, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        setImgSize("#sixWeiboFirstImg", 0.33, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        setImgSize("#sevWeiboFirstImg", 0.33, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        setImgSize("#eigWeiboFirstImg", 0.33, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        setImgSize("#ninWeiboFirstImg", 0.33, "http://bpic.588ku.com/element_origin_min_pic/16/06/13/22575ec71bab167.jpg");
                                        break;
                                }
                            });

                            $('#imgModal').on('show.bs.modal', function (event) {
                                var img = $(event.relatedTarget);
                                $("#modelImg").width($("#imgModal").innerWidth() * 0.5);
                                $("#modelImg").attr("src", img.attr("src"));
                            })
                        </script>
</div>
</@bootstrap.body>
</html>