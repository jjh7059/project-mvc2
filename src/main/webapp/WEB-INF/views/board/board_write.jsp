<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<header class="masthead-login">
    <div class="container position-relative">
        <div class="row justify-content-center">
            <div class="col-xl-6">
            <div class="mb-5" style="display: block;">
            	<div><h4>Board</h4></div>
				<div><h1>게시판 📋</h1></div>
			</div>
                <div class="text-center text-black">
                    <div class="mb-5" style="position: relative;">
	                    <div class="mb-5" style="border-bottom: 2px solid lightgray;"></div>
	                    <button id="notice_btn" type="button" class="togglebtn" onclick="notice_btn();">공지사항</button>
	                    <button id="board_btn" type="button" class="togglebtn" onclick="board_btn();">게시판</button>
	                    <button id="write_btn" type="button" class="togglebtn" onclick="write_btn();">글쓰기</button>
	                    <button id="board_manage_btn" type="button" class="togglebtn" onclick="board_manage_btn();">글관리</button>
                	</div>
                	
                	<!-- 글쓰기 -->
                	<div id="write" style="display: flex;">
	                	<c:choose>
	                	<c:when test="${loginMember != null }">
                		<form id="board_form" action="${pageContext.request.contextPath }/board_write" method="post" style="text-align: left;">
                			<select name="code" style="margin-bottom: 20px;">
                				<c:if test="${loginMember.status == 9 }">
                				<option>공지사항</option>
                				</c:if>
                				<option>게시글</option>
                			</select><br>
                			<label style="font-weight: bold; width: 100px; font-size: 20px;">작성자</label>
                			<input type="text" name="writer" readonly="readonly" value="${loginMember.email }" style="border: none; margin-bottom: 20px; font-size: 20px;"><br>
                			<label style="font-weight: bold; width: 100px; font-size: 20px;">제목</label>
                			<input type="text" id="subject" name="subject" placeholder="제목을 입력해주세요." style="width: 426px; margin-bottom: 20px; border: 1px solid #E6E7EC;"><br>
                			<label style="font-weight: bold; width: 100px; font-size: 20px;"></label>
                			<textarea id="content" name="content" cols=50 rows=10 style="margin-bottom: 40px; resize: none; border: 1px solid #E6E7EC;" placeholder="내용을 입력해주세요."></textarea><br>
                			<div style="text-align: center">
                				<button id="board_add_btn" type="button" style="width: 130px; height: 40px; background-color: black; color: white; outline: none; border: 0; border-radius: 5px;">작성</button>
                			</div>
               			</form>
               			</c:when>
               			<c:otherwise>
               			<div style="text-align: center; margin: auto; margin-top: 100px; border-bottom: 2px solid lightgray;">
               				<h3>게시글을 작성하기 위해 로그인 해주세요.</h3>
               			</div>
               			</c:otherwise>
               			</c:choose>
                	</div>
                </div>
            </div>
        </div>
    </div>
</header>

<section class="call-to-action-login text-white text-center">
    <div class="container position-relative">
        <div class="row justify-content-center">
            
        </div>
    </div>
</section>

<script type="text/javascript">
	$("#write_btn").css("border-bottom", "2px solid black");

	function notice_btn() {
		location.href = "${pageContext.request.contextPath }/board";
	}
	
	function board_btn() {
		location.href = "${pageContext.request.contextPath }/board_list";
	}
	
	function write_btn() {
		location.href = "${pageContext.request.contextPath }/board_write";
	}
	
	function board_manage_btn() {
		location.href = "${pageContext.request.contextPath }/board_manager";
	}
	
	$(".board_subject").click(function() {
		if($(this).parent(".board_item").children("div").last().css("display") == "none") {
			$(this).parent(".board_item").children("div").last().css("display", "flex");
			$(this).children("span").css("transform", "rotate(225deg)");
		} else {
			$(this).parent(".board_item").children("div").last().css("display", "none");
			$(this).children("span").css("transform", "rotate(45deg)");
		}
	});
	
	$("#board_add_btn").click(function() {
		if($("#subject").val() == "") {
			alert("제목을 입력해주세요.");
		} else if($("#content") == "") {
			alert("내용을 입력해주세요.");
		} else {
			$("#board_form").submit();	
		}
	});
</script>