<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
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
	            	
	            	<!-- 글목록 -->
	            	<h4 id="message" style="margin-bottom: 50px;">내가 쓴 게시글</h4>
	            	<div id="board"></div>
	            	<div class="page_wrap">
	             		<div class="page_nation"></div>
	            	</div>
	            </div>
	            <input type="hidden" id="loginMember_js" value="${loginMember }">
	            <input type="hidden" id="loginMember_email_js" value="${loginMember.email }">
	            <form id="board_form" style="text-align: left;">
             		<select id="code" name="code" style="margin-bottom: 20px;">
             			<c:if test="${loginMember.status == 9 }">
             			<option>공지사항</option>
             			</c:if>
             			<option>게시글</option>
             		</select><br>
             		<label style="font-weight: bold; width: 100px; font-size: 20px;">작성자</label>
             		<input type="hidden" id="num">
             		<input type="text" name="writer" id="writer" readonly="readonly" style="border: none; margin-bottom: 20px; font-size: 20px;"><br>
             		<label style="font-weight: bold; width: 100px; font-size: 20px;">제목</label>
             		<input type="text" id="subject" name="subject" class="update" style="width: 426px; margin-bottom: 20px; border: 1px solid #E6E7EC;"><br>
             		<label style="font-weight: bold; width: 100px; font-size: 20px;"></label>
             		<textarea id="updateContent" name="content" class="update" cols=50 rows=10 style="margin-bottom: 40px; resize: none; border: 1px solid #E6E7EC;"></textarea><br>
             		<div style="text-align: center">
             			<button id="board_update_btn" type="button" style="width: 130px; height: 40px; background-color: black; color: white; outline: none; border: 0; border-radius: 5px;">변경하기</button>
             			<button id="update_cancel_btn" type="button" style="width: 130px; height: 40px; background-color: black; color: white; outline: none; border: 0; border-radius: 5px;">취소</button>
             		</div>
               	</form>
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



<script id="template" type="text/x-handlebars-template">
		{{#each .}}
	    <div class="board_item">
		    <div class="board_subject" style="width: 100%; height: 50px; border-bottom: 2px solid #E6E7EC; justify-content: space-between; font-weight: bold; display: flex; cursor: pointer; margin-bottom: 30px;">
		   		{{subject}}
		        <span style="width: 15px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; font-weight: bold; transform: rotate(45deg);"></span>
		    </div>
		    <div id="board_content" style="display: none; flex-wrap: wrap; margin-top: 30px; border-bottom-left-radius: 30px; border-bottom-right-radius: 30px; border-top-right-radius: 30px; background-color: #ecf0f1; padding: 30px; margin-bottom: 50px;">
		    	<span style="margin-right: 10px;">📄</span>
		   		<span style="display: block; width: 100%; font-size: 13px; text-align: left; font-weight: bold;">
		        작성자&nbsp;:&nbsp;{{writer}}<br>
		        작성일&nbsp;:&nbsp;{{regdate}}<br><br>
			    {{content}}
		        </span>
				<div style="text-align: center; width: 100%; margin-top: 60px;">
	               	<button id="board_modify_btn" type="button" onclick="board_modify({{num}});" style="width: 130px; height: 40px; background-color: black; color: white; outline: none; border: 0; border-radius: 5px;">변경</button>
	               	<button id="board_delete_btn" type="button" onclick="board_remove({{num}});" style="width: 130px; height: 40px; background-color: black; color: white; outline: none; border: 0; border-radius: 5px;">삭제</button>
	           	</div>
	        </div>
	    </div>
		{{/each}}
</script>

<script type="text/javascript">
	$("#board_manage_btn").css("border-bottom", "2px solid black");
	$("#board_form").hide();

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
	
	$(document).on("click", ".board_subject", function() {
		if($(this).parent(".board_item").children("#board_content").css("display") == "none") {
			$(this).parent(".board_item").children("#board_content").css("display", "flex");
			$(this).children("span").css("transform", "rotate(225deg)");
		} else {
			$(this).parent(".board_item").children("#board_content").css("display", "none");
			$(this).children("span").css("transform", "rotate(45deg)");
		}
	});
	
</script>

<script type="text/javascript">
	var page = 1;
	var writer = $("#loginMember_email_js").val();
	
	if($("#loginMember_js").val() == "") {
		$("#message").html("게시글 관리를 위해 로그인을 해주세요.");
	} else {
		boardDisplay(page);			
	}
	
	function boardDisplay(pageNum) {
		page = pageNum;
		$.ajax({
			type: "get",
			url: "board_manager_ajax?pageNum=" + pageNum + "&writer=" + writer,
			success: function(json) {
				if(json.managerBoardList.length == 0) {
					$("#board").html("검색된 게시글이 존재하지 않습니다.");
					return;
				}
				
				var source = $("#template").html();
				var template = Handlebars.compile(source);
				
				$("#board").html(template(json.managerBoardList));
				
				pageDisplay(json.pager);
			},
			error: function(xhr) {
				alert("에러코드 = " + xhr.status);
			}
		});
	}
	
	function pageDisplay(pager) {
		var html = "";
		if(pager.startPage > pager.blockSize) {
			html += "<a class='arrow pprev' href='javascript:boardDisplay(1);'></a>";
			html += "<a class='arrow prev' href='javascript:boardDisplay(" + pager.prevPage + ");'></a>";
		} else {
			html += "<a class='arrow pprev' style='pointer-events: none;'></a>";
			html += "<a class='arrow prev' style='pointer-events: none;'></a>";
		}
		
		for(i = pager.startPage; i <= pager.endPage; i++) {
			if(pager.pageNum != i) {
				html += "<a href='javascript:boardDisplay(" + i + ");'>" + i + "</a>";
			} else {
				html += "<a>" + i + "</a>";
			}
		}
		
		if(pager.endPage != pager.totalPage) {
			html += "<a class='arrow next' href='javascript:boardDisplay(" + pager.nextPage + ");'></a>";
			html += "<a class='arrow nnext' href='javascript:boardDisplay(" + pager.totalPage + ");'></a>";
		} else {
			html += "<a class='arrow next' style='pointer-events: none;'></a>";
			html += "<a class='arrow nnext' style='pointer-events: none;'></a>";
		}
		
		$(".page_nation").html(html);
	}
	
	function board_remove(num) {
		if(confirm("정말 삭제하시겠습니까?")){
			$.ajax({
				type: "put",
				url: "board_modify",
				contentType: "application/json",
				data: JSON.stringify({"num":num, "status":1}),
				dataType: "text",
				success: function(text) {
					if(text == "success") {
						boardDisplay(page);
					}
				},
				error: function(xhr) {
					alert("에러코드 = " + xhr.status);
				}
			});
		}
	}
	
	function board_modify(num) {
		$(".update").val("");
		$("#board_form").hide();
		$("#board").hide();
		$(".page_wrap").hide();
		$("#board_form").show();
		
		$.ajax({
			type: "get",
			url: "board_view/" + num,
			dataType: "json",
			success: function(json) {
				$("#num").val(json.num);
				$("#writer").val(json.writer);
				$("#subject").val(json.subject);
				$("#updateContent").val(json.content);
			},
			error: function(xhr) {
				alert("에러코드 = " + xhr.status);
			}
		});
	}
	
	$("#board_update_btn").click(function() {
		var num = $("#num").val();
		var code = $("#code option:selected").val();
		var subject = $("#subject").val();
		var content = $("#updateContent").val();
		
		if(subject == "") {
			alert("제목을 입력해 주세요.");
			return;
		}
		
		if(content == "") {
			alert("내용을 입력해 주세요.");
			return;
		}
		
		//게시글 저장을 위한 웹프로그램을 요청하여 응답 처리
		$.ajax({
			type: "put",
			url: "board_modify",
			contentType: "application/json",
			data: JSON.stringify({"num":num, "code":code, "subject":subject,"content":content}),
			dataType: "text",
			success: function(text) {
				if(text == "success") {
					$("#board").show();
					$(".page_wrap").show();
					$("#board_form").hide();
					boardDisplay(page);
				}
			},
			error: function(xhr) {
				alert("에러코드 = " + xhr.status);
			}
		});
	});
	
	$("#update_cancel_btn").click(function() {
		$("#board").show();
		$(".page_wrap").show();
		$("#board_form").hide();
		boardDisplay(page);
	});
</script>