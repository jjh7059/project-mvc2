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
                	
                	<!-- 게시판 -->
                	<div id="board"></div>
                	
                	<div class="page_wrap">
	                	<div class="page_nation">
		                	
	                	</div>
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



<script id="template" type="text/x-handlebars-template">
		{{#each .}}
	    <div class="board_item">
		    <div class="board_subject" style="width: 100%; height: 50px; border-bottom: 2px solid #E6E7EC; justify-content: space-between; font-weight: bold; display: flex; cursor: pointer; margin-bottom: 30px;">
		   		{{subject}}
		        <span style="width: 15px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; font-weight: bold; transform: rotate(45deg);"></span>
		    </div>
		    <div id="board_content" style="display: none; margin-top: 30px; border-bottom-left-radius: 30px; border-bottom-right-radius: 30px; border-top-right-radius: 30px; background-color: #ecf0f1; padding: 30px; margin-bottom: 50px;">
		    	<span style="margin-right: 10px;">📄</span>
		   		<span style="display: block; font-size: 13px; text-align: left; font-weight: bold;">
		        작성자&nbsp;:&nbsp;{{writer}}<br>
		        작성일&nbsp;:&nbsp;{{regdate}}<br><br>
			    {{content}}
		        </span>
	        </div>
	    </div>
		{{/each}}
</script>

<script type="text/javascript">
	$("#board_btn").css("border-bottom", "2px solid black");

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
	
	boardDisplay(page);
	
	function boardDisplay(pageNum) {
		page = pageNum;
		$.ajax({
			type: "get",
			url: "board_list_ajax?pageNum=" + pageNum,
			success: function(json) {
				if(json.pageBoardList.length == 0) {
					$("#board").html("검색된 게시글이 존재하지 않습니다.");
					return;
				}
				
				var source = $("#template").html();
				var template = Handlebars.compile(source);
				
				$("#board").html(template(json.pageBoardList));
				
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
</script>
