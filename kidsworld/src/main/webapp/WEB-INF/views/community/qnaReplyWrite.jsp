<%--
  Created by IntelliJ IDEA.
  User: hanjiheon
  Date: 2022/03/07
  Time: 8:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>질문과 답변</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="${path}/resources/css/style.css" />
    <style>

        .banner_section{
            position: relative;
            max-width: 1440px;
        }
        .subbanner_img{
            position: absolute;
            width: 1440px;
        }
        .subbanner_title_text{
            position: absolute;
            width: 1440px;
            font-size: 70px;
            color: white;
            text-align: center;
            line-height: 630px;
            font-weight: bold;
        }
        .subbanner_title_text2{
            position: absolute;
            width: 1440px;
            font-size: 40px;
            color: white;
            text-align: center;
            line-height: 780px;
        }


        #qnawrite_wrapwrap{
            position: relative;
            top: 800px;
            width: 1440px;
            height: 793px;
            /*margin-left: 170px;*/
        }

        #qnawrite_wrap{
            position: relative;
            border-collapse: collapse;
            margin-left: 330px;
        }

        .box1{
            border: 1px solid black;
            border-left: none;
            width: 150px;
            height: 50px;
            font-size: 18px;
            text-align: center;
        }
        .box2{
            border: 1px solid black;
            border-right: none;
            width: 600px;
            height: 50px;
        }

        .title_box{
            font-size: 20px;
            background-color: #b0dfff;
        }
        .subbox1{
            width: 560px;
            height: 30px;
            font-size: 15px;
            padding-left: 15px;
            margin-left: 10px;
        }

        #submitBtn{
            margin-left: 990px;
            margin-top: 25px;
            background-color: #fe5c24;
            color: white;
            font-size: 17px;
            border: none;
            border-radius: 10px;
            padding: 4px 15px;
            cursor: pointer;
            transition: 0.5s;
        }
        #submitBtn:hover{
            background-color: #2493e0;
        }



        /*                      footer                  */
        footer{
            top: 1000px;
        }

    </style>
</head>
<body>
<%------------------------------------------------------%>
<%-----------------------헤더 css------------------------%>
<%------------------------------------------------------%>

<jsp:include page="../commons/header.jsp"/>

<%------------------------------------------------------%>
<%------------------------------------------------------%>
<%------------------------------------------------------%>

<section class="banner_section">
    <div>
        <img class="subbanner_img" src="${path}/resources/img/banner_img/subtitle1.png">
        <span class="subbanner_title_text">답 변 달 기</span>
        <span class="subbanner_title_text2">.QnA reply detail</span>
    </div>
</section>


<div id="qnawrite_wrapwrap">
    <sec:authorize access="isAuthenticated()">
        <sec:authentication var="loginMember" property="principal.member"/>
        <form action="${path}/community/qnaReplySubmit" method="post">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="hidden" name="qUserNum" value="${original.qUserNum}" />
            <table id="qnawrite_wrap">
                <tr>
                    <td class="box1 title_box">제목</td>
                    <td class="box2 title_box">
                        <input class="subbox1" type="text" name="qTitle" value="re. ${original.qTitle}"/>
                    </td>
                </tr>
                <tr>
                    <td class="box1">작성자</td>
                    <td class="box2">
                        <input class="subbox1" type="text" name="qWriter" value="${loginMember.uName}" />
                    </td>
                </tr>
                <tr>
                    <td class="box1">내용</td>
                    <td class="box2">
                        <textarea name="qContent" id="editor">
                            <p>질의응답은 본인과 관리자만 볼 수 있습니다.</p>
                            <p>작성 후 수정하거나 삭제할 수 없으니,</p>
                            <p>이 점에 유의하시어 작성해주시기 바랍니다.</p>
                            <p>감사합니다.</p>
                        </textarea>
                    </td>
                </tr>
            </table>
            <input id="submitBtn" type="submit" value="작성하기" />

            <input type="hidden" name="origin" value="${original.origin}" />
            <input type="hidden" name="depth" value="${original.depth}" />
            <input type="hidden" name="seq" value="${original.seq}" />
            <input type="hidden" name="page" value="${cri.page}" />
            <input type="hidden" name="perPageNum" value="${cri.perPageNum}" />

        </form>
    </sec:authorize>
    <sec:authorize access="isAnonymous()">
        로그인 된 사용자만 이용할 수 있는 페이지입니다.
    </sec:authorize>
</div>




<jsp:include page="../commons/footer.jsp"/>




<script src="https://cdn.tiny.cloud/1/ij69tv5gszyloklg635hp8nn2o2d7jsgyv1u5y7v5fco6m8w/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
<script>
    var plugins = ["textcolor", "link", "image"];
    var edit_toolbar = 'link image forecolor backcolor';

    tinymce.init({
        language : "ko_KR", // 한글 판으로 변경
        width : 600,
        height : 500,
        menubar : false,
        selector: '#editor',
        plugins: plugins,
        toolbar: edit_toolbar,
        toolbar_mode: 'floating',
        tinycomments_mode: 'embedded',
        tinycomments_author: 'Author name',
        /* image upload */
        image_title : true,
        automatic_uploads : true,
        file_picker_types : "image",
        file_picker_callback : function(cb, value, meta){
            var input = document.createElement("input");
            input.setAttribute("type","file");
            input.setAttribute("accept","image/*");

            input.onchange = function(){
                var file = this.files[0];
                var reader  = new FileReader();
                reader.onload = function(){
                    var id = "blobid"  +(new Date()).getTime();
                    var blobCache = tinymce.activeEditor.editorUpload.blobCache;
                    var base64 = reader.result.split(',')[1];
                    var blobInfo = blobCache.create(id,file,base64);
                    blobCache.add(blobInfo);
                    cb(blobInfo.blobUri(),{title : file.name});
                };
                reader.readAsDataURL(file);
            };
            input.click();
        }
        /* image upload end */
    });
</script>

<script>
    $(window).scroll(function () {
        var height = $(document).scrollTop();
        if (height > 0) {
            // $(".header_wrap").css('position', 'fixed');
            $(".nav_down").css('position', 'absolute');
        } else if (height === 0){
            $(".nav_down").css('position', 'relative');
        }
    });
</script>
</body>
</html>