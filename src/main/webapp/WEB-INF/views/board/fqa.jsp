<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<header class="masthead-login">
    <div class="container position-relative">
        <div class="row justify-content-center">
            <div class="col-xl-6">
            <div class="mb-5" style="display: block;">
            	<div><h4>FAQ</h4></div>
				<div><h1>무엇이든<br>물어보세요! 📣</h1></div>
			</div>
                <div class="text-center text-black">
                    <div class="mb-5" style="position: relative; margin-top: 100px;"></div>
                    <div class="fqa-item">
	                	<div class="faq-qestion" style="width: 100%; height: 50px; border-bottom: 2px solid #E6E7EC; justify-content: space-between; font-weight: bold; display: flex; cursor: pointer; margin-bottom: 30px;">
	                		Co-Dev는 어떤 곳인가요?
	                		<span style="width: 15px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; font-weight: bold; transform: rotate(45deg);"></span>
	                	</div>
	                	<div style="display: none; margin-top: 30px; border-bottom-left-radius: 30px; border-bottom-right-radius: 30px; border-top-right-radius: 30px; background-color: #FFE102; padding: 30px; margin-bottom: 50px;">
	               			<span style="margin-right: 10px;">📮</span>
	               			<span style="font-size: 13px; text-align: left; font-weight: bold;">
		               			"Co-Dev는 '더 나은 도시 생활'을 꿈꾸는 공유오피스 브랜드 입니다. 새로운 업무 환경을 위한 오피스, 삶을 풍요롭게 하는
		               			서비스를 만들며, 이웃과 지역 사회를 연결하여 일상을 가치 있게 만들어 줄 무언가를 고민합니다. 한정된 업무 공간을 넘어 삶의
		               			전반에 걸친 솔루션을 제공하는 것. 도시인의 라이프스타일 플랫폼으로 성장해갈 Co-Dev를 기대해주세요!"
	               			</span>
               			</div>
                	</div>
                	<div class="fqa-item">
	                	<div class="faq-qestion" style="width: 100%; height: 50px; border-bottom: 2px solid #E6E7EC; justify-content: space-between; font-weight: bold; display: flex; cursor: pointer;  margin-bottom: 30px;">
	                		Co-Dev는 어디에 있나요?
	                		<span style="width: 15px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; font-weight: bold; transform: rotate(45deg);"></span>
	                	</div>
	                	<div style="display: none; margin-top: 30px; border-bottom-left-radius: 30px; border-bottom-right-radius: 30px; border-top-right-radius: 30px; background-color: #FFE102; padding: 30px; margin-bottom: 50px;">
	               			<span style="margin-right: 10px;">📮</span>
	               			<span style="font-size: 13px; text-align: left; font-weight: bold;">
		               			"Co-Dev는 서울의 교통&amp;문화적 요충지에 위치합니다. 앞으로 더 많은 Co-Dev를 더 가까이서 만나볼 수 있을거예요."<br><br>
		               			Co-Dev 서초 - 서울 서초구 서초동 0000-0,0,0 (강남역 도보 00분, 양재역 도보 00분)<br>
		               			Co-Dev 성수 - 서울 성동구 뚝섬로 000 (뚝섬역 도보 00분, 서울숲역 도보 0분)
	               			</span>
               			</div>
                	</div>
                	<div class="fqa-item">
	                	<div class="faq-qestion" style="width: 100%; height: 50px; border-bottom: 2px solid #E6E7EC; justify-content: space-between; font-weight: bold; display: flex; cursor: pointer;  margin-bottom: 30px;">
	                		투어 신청은 어떻게 하나요?
	                		<span style="width: 15px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; font-weight: bold; transform: rotate(45deg);"></span>
	                	</div>
	                	<div style="display: none; margin-top: 30px; border-bottom-left-radius: 30px; border-bottom-right-radius: 30px; border-top-right-radius: 30px; background-color: #FFE102; padding: 30px; margin-bottom: 50px;">
	               			<span style="margin-right: 10px;">📮</span>
	               			<span style="font-size: 13px; text-align: left; font-weight: bold;">
		               			"웹사이트의 메인화면 상단에서 'BOOKING'을 탭 하세요. 
		               			투어를 희망하는 사이트와 날짜를 지정하고 간단한 설문을 작성하면 투어 예약이 완료됩니다. 
		               			투어 당일, 커뮤니티 매니저를 통해 상세한 이용 상담을 받으실 수 있을거에요."
	               			</span>
               			</div>
                	</div>
                	<div class="fqa-item">
	                	<div class="faq-qestion" style="width: 100%; height: 50px; border-bottom: 2px solid #E6E7EC; justify-content: space-between; font-weight: bold; display: flex; cursor: pointer;  margin-bottom: 30px;">
	                		투어 소요 시간은 어떻게 되나요?
	                		<span style="width: 15px; height: 15px; border-bottom: 1px solid black; border-right: 1px solid black; font-weight: bold; transform: rotate(45deg);"></span>
	                	</div>
	                	<div style="display: none; margin-top: 30px; border-bottom-left-radius: 30px; border-bottom-right-radius: 30px; border-top-right-radius: 30px; background-color: #FFE102; padding: 30px; margin-bottom: 50px;">
	               			<span style="margin-right: 10px;">📮</span>
	               			<span style="font-size: 13px; text-align: left; font-weight: bold;">
		               			"투어 시간은 둘러보는 오피스 및 데스크 수에 따라 상이하며, 평균 20분-30분 정도 소요됩니다. 
		               			원하는 임대 계약 조건을 충분히 숙고하고 방문하시면 보다 신속한 상담이 가능합니다. 
		               			다만, 약속된 시간보다 늦게 방문하실 경우 투어 시간에 제한이 생길 수 있다는 점, 참고해주세요."
	               			</span>
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

<script type="text/javascript">
	$(".faq-qestion").click(function() {
		if($(this).parent(".fqa-item").children("div").last().css("display") == "none") {
			$(this).parent(".fqa-item").children("div").last().css("display", "flex");
			$(this).children("span").css("transform", "rotate(225deg)");
		} else {
			$(this).parent(".fqa-item").children("div").last().css("display", "none");
			$(this).children("span").css("transform", "rotate(45deg)");
		}
	});
</script>