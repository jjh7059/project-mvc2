<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<header class="masthead-login">
    <div class="container position-relative">
        <div class="row justify-content-center">
            <div class="col-xl-6">
            <div class="mb-5" style="display: flex;">
				<div><h1>오피스<br>투어 &amp; 상담 예약 ✍️</h1></div>
			</div>
				<c:choose>
				<c:when test="${loginMember != null}">
                <div class="text-center text-black">
                    <div class="mb-5" style="position: relative;">
	                    <div class="mb-5" style="border-bottom: 2px solid lightgray;"></div>
	                    <button id="loc_btn" type="button" class="togglebtn" onclick="loc_btn();">위치</button>
	                    <button id="tourroom_btn" type="button" class="togglebtn" onclick="tourroom_btn();">투어룸</button>
	                    <button id="rt-btn" type="button" class="togglebtn" onclick="rt_btn();">예약시간</button>
	                    <button id="mi-btn" type="button" class="togglebtn" onclick="mi_btn();">고객정보</button>
                	</div>
                	<!-- 입력폼 -->
                	<form id="tour_form" action="${pageContext.request.contextPath }/booking" method="post">
                		<input type="hidden" id="locItem" name="loc">
                		<input type="hidden" id="btime" name="btime">
                		<input type="hidden" id="room" name="room">
                		<!-- 위치 -->
	                	<div id="loc" style="display: flex;">
	                		<div style="width: 300px; height: 480px; border: 1px solid #E6E7EC; border-radius: 5px; overflow: hidden; margin-right: 30px;">
	                			<img alt="#" src="${pageContext.request.contextPath }/images/office1.jpg" width="300" height="200">
	                			<div style="padding: 10px; text-align: left;">
	                				<h6>CO-DEV 서초 393</h6>
	                				<p>방문 투어&amp;상담 받고, 1개월 무료 혜택!<br>강남역, 양재역 도보 10분 거리</p><br>
	                				<p>📍 서초동 1338-5번지, 서초구, 서울, KR</p>
	                				<p>📞 +821012345678</p>
	                			</div>
	                			<button class="loc-choice-btn" value="서초" type="button" style="width: 280px; height: 50px; background-color: ligthgray; color: white; outline: none; border: 0; border-radius: 5px;">선택</button>
	                		</div>
	                		<div style="width: 300px; height: 480px; border: 1px solid #E6E7EC; border-radius: 5px; overflow: hidden;">
	                			<img alt="#" src="${pageContext.request.contextPath }/images/office2.png" width="300">
	                			<div style="padding: 10px; text-align: left;">
	                				<h6>CO-DEV 성수 101</h6>
	                				<p>방문 투어&amp;상담을 신청하세요<br>성수역, 뚝섬역, 서울숲 도보 10분 거리</p><br>
	                				<p>📍 뚝섬로 341, 성동구, 서울, KR, 04780</p>
	                				<p>📞 +821012345678</p>
	                			</div>
	                			<button class="loc-choice-btn" value="성수" type="button" style="width: 280px; height: 50px; background-color: ligthgray; color: white; outline: none; border: 0; border-radius: 5px;">선택</button>
	                		</div>
	                	</div>
	                	<!-- 투어룸 -->
	                	<div id="tourRoom" style="display: none;">
	                		<div style="display: block;">
		                		<div class="book-choice" style="width: 300px; height: 310px; border: 1px solid #E6E7EC; border-radius: 5px; overflow: hidden; margin-right: 30px; margin-bottom: 30px;">
		                			<img alt="#" src="${pageContext.request.contextPath }/images/rounge_desk.jpg" width="300" height="200">
		                			<div style="padding: 10px; text-align: left;">
		                				<h6>라운지 데스크</h6>
		                			</div>
		                			<button class="room-choice-btn" value="라운지 데스크" type="button" style="width: 280px; height: 50px; background-color: lightgray; color: white; outline: none; border: 0; border-radius: 5px;">선택</button>
		                		</div>
		                		<div class="book-choice" style="width: 300px; height: 300px; border: 1px solid #E6E7EC; border-radius: 5px; overflow: hidden;">
		                			<img alt="#" src="${pageContext.request.contextPath }/images/private_room.jpg" width="300">
		                			<div style="padding: 10px; text-align: left;">
		                				<h6>프라이빗 오피스(1인)</h6>
		                			</div>
		                			<button class="room-choice-btn" value="프라이빗 오피스(1인)" type="button" style="width: 280px; height: 50px; background-color: lightgray; color: white; outline: none; border: 0; border-radius: 5px;">선택</button>
		                		</div>
	                		</div>
	                		<div style="display: block;">
		                		<div class="book-choice" style="width: 300px; height: 310px; border: 1px solid #E6E7EC; border-radius: 5px; margin-right: 30px; overflow: hidden; margin-bottom: 30px;">
		                			<img alt="#" src="${pageContext.request.contextPath }/images/private_desk.jpg" width="300" height="200">
		                			<div style="padding: 10px; text-align: left;">
		                				<h6>프라이빗 데스크</h6>
		                			</div>
		                			<button class="room-choice-btn" value="프라이빗 데스크" type="button" style="width: 280px; height: 50px; background-color: lightgray; color: white; outline: none; border: 0; border-radius: 5px;">선택</button>
		                		</div>
		                		<div class="book-choice" style="width: 300px; height: 300px; border: 1px solid #E6E7EC; border-radius: 5px; overflow: hidden;">
		                			<img alt="#" src="${pageContext.request.contextPath }/images/private_room2.jpg" width="300">
		                			<div style="padding: 10px; text-align: left;">
		                				<h6>프라이빗 오피스(2인)</h6>
		                			</div>
		                			<button class="room-choice-btn" value="프라이빗 오피스(2인)" type="button" style="width: 280px; height: 50px; background-color: lightgray; color: white; outline: none; border: 0; border-radius: 5px;">선택</button>
		                		</div>
	                		</div>
	                	</div>
	                	<!-- 예약시간 -->
	                	<div id="reservationTime" style="display: none;">
	                		<div style="margin-bottom: 30px;">
	                			<h3>예약 날짜 📆</h3>
	                			<input type="text" id="datePicker" name="bdate" placeholder="날짜를 선택해주세요" readonly="readonly" style="margin-top: 10px; margin-bottom: 30px; font-weight: 600; text-align: center; cursor: pointer;">
	                		</div>
	                		<div>
	                			<h3>예약 시간 ⌚</h3>
	                			<button class="btime-choice-btn" type="button" style="width: 155px; height: 65px; margin-top: 10px; background-color: lightgray; color: white; outline: none; border: 0; border-radius: 5px;">10:00</button>
	                			<button class="btime-choice-btn" type="button" style="width: 155px; height: 65px; margin-top: 10px; background-color: lightgray; color: white; outline: none; border: 0; border-radius: 5px;">11:00</button>
	                			<button class="btime-choice-btn" type="button" style="width: 155px; height: 65px; margin-top: 10px; background-color: lightgray; color: white; outline: none; border: 0; border-radius: 5px;">13:00</button>
	                			<button class="btime-choice-btn" type="button" style="width: 155px; height: 65px; margin-top: 10px; background-color: lightgray; color: white; outline: none; border: 0; border-radius: 5px;">14:00</button>
	                		</div>
	                	</div>
	                	<!-- 예약정보확인 -->
	                	<div id="memberInfo" style="display: none;">
	                		<h3>투어/상담 예약 정보를 확인해주세요.</h3>
	                		<div style="margin-top: 30px; text-align: center; margin-top: 50px;">
	                			<label style="font-size: 15px; font-weight: bold; width: 50px;">이름:</label>
	                			<input type="text" value="${loginMember.name }" disabled="disabled" style="width: 350px; height: 40px; margin-left: 30px; margin-bottom: 10px; border-radius: 5px; border: 1px solid #D0D0D0;"><br>
	                			<label style="font-size: 15px; font-weight: bold;">이메일:</label>
	                			<input type="text" value="${loginMember.email }" name="email" readonly="readonly" style="width: 350px; height: 40px; margin-left: 30px; margin-bottom: 10px; background-color: #F8F8F8; border: 1px solid #D0D0D0; border-radius: 5px;"><br>
	                			<label style="font-size: 15px; font-weight: bold; width: 50px;">전화:</label>
	                			<input type="text" value="${loginMember.phone }" disabled="disabled" style="width: 350px; height: 40px; margin-left: 30px; margin-bottom: 30px; border-radius: 5px; border: 1px solid #D0D0D0;"><br>
	                		</div>
	                		<div style="width: 460px; height: 230px; border: 1px solid #D0D0D0; margin: 0 auto; border-radius: 5px; text-align: left; padding: 20px; margin-bottom: 50px;">
	                			<span id="verify-loc" style="font-size: 20px; font-weight: bold;"></span><br><br>
	                			<label style="font-size: 18px; width: 180px; margin-bottom: 10px;">예약 날짜:</label>
	                			<span id="verify-bdate" style="font-size: 18px; font-weight: bold;"></span><br>
	                			<label style="font-size: 18px; width: 180px; margin-bottom: 10px;">예약 시간:</label>
	                			<span id="verify-btime" style="font-size: 18px; font-weight: bold;"></span><br>
	                			<label style="font-size: 18px; width: 180px; margin-bottom: 10px;">투어 룸:</label>
	                			<span id="verify-room" style="font-size: 18px; font-weight: bold;"></span><br>
	                		</div>
	                		<input type="checkbox" id="cb1" style="border: 1px solid #D0D0D0; cursor: pointer;">
	                		<label for="cb1" style="margin-bottom: 10px; margin-left: 10px; cursor: pointer;">방문 예약을 위한 개인정보 수집 및 이용 동의(필수)</label><br>
	                		<input type="checkbox" id="cb2" style="border: 1px solid #D0D0D0; cursor: pointer;">
	                		<label for="cb2" style="margin-bottom: 10px; cursor: pointer;">더 나은 도시생활, Co-Dev 이용 약관에 동의합니다.</label><br>
	                		<input type="checkbox" id="cb3" style="border: 1px solid #D0D0D0; cursor: pointer;">
	                		<label for="cb3" style="cursor: pointer;">프로모션 및 정보를 받아 보시겠습니까?</label><br>
	                		<button id="booking-submit" type="button" style="width: 155px; height: 65px; margin-top: 50px; background-color: black; color: white; outline: none; border: 0; border-radius: 5px;">예약</button>
	                	</div>
                	</form>
                </div>
                </c:when>
                <c:otherwise>
                <div style="text-align: center; margin: auto; margin-top: 100px; border-bottom: 2px solid lightgray;">
                	<h2>투어&amp;상담 예약을 위해 로그인 해주세요.</h2>
                </div>
                </c:otherwise>
                </c:choose>
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

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript">
	$("#loc_btn").css("border-bottom", "2px solid black");

	function loc_btn() {
		$("#loc_btn").css("border-bottom", "2px solid black");
		$("#tourroom_btn").css("border-bottom", "");
		$("#rt-btn").css("border-bottom", "");
		$("#mi-btn").css("border-bottom", "");
		
		$("#loc").css("display", "flex");
		$("#tourRoom").css("display", "none");
		$("#reservationTime").css("display", "none");
		$("#memberInfo").css("display", "none");
	}
	
	function tourroom_btn() {
		$("#loc_btn").css("border-bottom", "");
		$("#tourroom_btn").css("border-bottom", "2px solid black");
		$("#rt-btn").css("border-bottom", "");
		$("#mi-btn").css("border-bottom", "");
		
		$("#loc").css("display", "none");
		$("#tourRoom").css("display", "flex");
		$("#reservationTime").css("display", "none");
		$("#memberInfo").css("display", "none");
	}
	
	function rt_btn() {
		$("#loc_btn").css("border-bottom", "");
		$("#tourroom_btn").css("border-bottom", "");
		$("#rt-btn").css("border-bottom", "2px solid black");
		$("#mi-btn").css("border-bottom", "");
		
		$("#loc").css("display", "none");
		$("#tourRoom").css("display", "none");
		$("#reservationTime").css("display", "block");
		$("#memberInfo").css("display", "none");
	}
	
	function mi_btn() {
		$("#loc_btn").css("border-bottom", "");
		$("#tourroom_btn").css("border-bottom", "");
		$("#rt-btn").css("border-bottom", "");
		$("#mi-btn").css("border-bottom", "2px solid black");
		
		$("#loc").css("display", "none");
		$("#tourRoom").css("display", "none");
		$("#reservationTime").css("display", "none");
		$("#memberInfo").css("display", "block");
	}
	
	<%-- 위치 js --%>
	$(".loc-choice-btn").mouseover(function() {
		$(this).css("background-color", "black");
	});
	
	$(".loc-choice-btn").mouseout(function() {
		$(this).css("background-color", "lightgray");
	});
	
	$(".loc-choice-btn").click(function() {
		$(this).css("background-color", "black");
		$(this).off("mouseover");
		$(this).off("mouseout");
		$("#locItem").val($(this).val());
		$("#verify-loc").html($(this).val() + " 일반입주 투어");
		$(".loc-choice-btn").not($(this)).css("background-color", "lightgray");
		tourroom_btn();
	});
	
	<%-- 투어룸 js --%>
	$(".room-choice-btn").mouseover(function() {
		$(this).css("background-color", "black");
	});
	
	$(".room-choice-btn").mouseout(function() {
		$(this).css("background-color", "lightgray");
	});
	
	$(".room-choice-btn").click(function() {
		$(this).css("background-color", "black");
		$(this).off("mouseover");
		$(this).off("mouseout");
		$("#room").val($(this).val());
		$("#verify-room").html($(this).val());
		$(".room-choice-btn").not($(this)).css("background-color", "lightgray");
		rt_btn();
	});
	
	<%-- 시간예약 js --%>
	$("#datePicker").datepicker({
		format : "yyyy-mm-dd",
		language : "kr",
		startDate : '+0d',
		todayHighlight : true
	});
	
	$(".btime-choice-btn").mouseover(function() {
		$(this).css("background-color", "black");
	});
	
	$(".btime-choice-btn").mouseout(function() {
		$(this).css("background-color", "lightgray");
	});
	
	$(".btime-choice-btn").click(function() {
		$(this).css("background-color", "black");
		$(this).off("mouseover");
		$(this).off("mouseout");
		$("#btime").val($(this).html());
		$(".btime-choice-btn").not($(this)).css("background-color", "lightgray");
		
		if($("#datePicker").val() == "" || $("#datePicker").val() == null) {
			$(this).css("background-color", "lightgray");
			alert("날짜를 선택해주세요.");
		} else {
			var dotDate = $("#datePicker").val().replaceAll("-", ".");
			$("#verify-bdate").html(dotDate);
			$("#verify-btime").html($(this).html());
			mi_btn();
		}
	});
	
	$("#booking-submit").click(function() {
		if($("#locItem").val() == "") {
			alert("위치를 선택해주세요.");
			loc_btn();
		} else if($("#room").val() == "") {
			alert("투어 룸을 선택해주세요.");
			tourroom_btn();
		} else if($("#btime").val() == "") {
			alert("예약 날짜 및 시간을 선택해주세요.");
			rt_btn();
		} else if($("input:checkbox[id=cb1]").is(":checked") == false){
			alert("개인정보 수집 및 이용에 동의 해야합니다.");
		} else {
			$("#tour_form").submit();
		}
		
	});
</script>