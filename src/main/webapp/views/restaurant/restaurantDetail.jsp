<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
  <head>
 	<link rel="stylesheet" href="/assets/css/restaurantDetail.css">
 	<script type="text/javascript"src="/assets/js/restaurant.js"></script>
 	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.2/kakao.min.js"
  integrity="sha384-TiCUE00h649CAMonG018J2ujOgDKW/kVWlChEuu4jK2vxfAAD0eZxzCKakxg55G4" crossorigin="anonymous"></script>
<script>
  Kakao.init('597a12321ce91d26c9101324b5955ebd'); // 사용하려는 앱의 JavaScript 키 입력
</script>
    <%@ include file="/views/common/head.jsp"%>
  
  </head>
  <body id="body"  style="font-family: 'GmarketSans'">  
  <%@ include file="/views/common/header.jsp"%>
  
  
 <div class="res_con_wrap">
  <div class = "res_content">
    <div class="res_left_container">
    <div class="res_info_wrap">
        <div class="res_header" >
            <img src="/assets/image/restaurant_images/김볶스.jpg" alt="대한옥">
            <img src="/assets/image/restaurant_images/니뽕내뽕 안양1번가점.jpg" alt="대한옥">
        </div>
            <div class="details">
                <h1 class="">띵호</h1>
                <div class="rating">
                    <span>3.1</span>
                    <img src="" alt="Dining image">
                    <span>review 갯수</span>
                </div>
                <div id="share_pop" class="layer_pop">
                		<img alt="" src="/assets/image/close.png" onclick="closePop()">
                	<div class="share_flex">
                		<h4>공유하기</h4>
                		<ul>
                		<li><img alt="" src="/assets/image/icon-insta.png"><p>인스타</p></li>
                		<li><img alt="" src="/assets/image/icon-kakao.png" onclick="shareMessage()"><p>카카오</p></li>
                		<li><img alt="" src="/assets/image/icon-twitter.png" onclick="shareTwitter()"><p>트위터</p></li>
                		</ul>
                	</div>
                </div>
                <p class="address">${result.location }</p>
                <p class="contact">&nbsp 전화: ${result.restaurantPhone }</p>
                <p class="features">&nbsp 서민적인, 점심식사, 저녁식사, 좌식테이블</p>
                <div class="share" onclick="openPop()">
                링크
                </div>
            </div>

        <div class="recommendations">
            <h2>'띵호' 같은 중식 맛집</h2>
            <div class="item">
            <img src="/assets/image/logo.png" alt="대한옥">
                <div class="info">
                    <span>하이디라오 영등포지점</span>
                    <span>훠궈, 토마토</span>
                </div>
            </div>
            <div class="item">
            <img src="/assets/image/logo.png" alt="대한옥">
                <div class="info">
                    <span>승남집</span>
                    <span>우삼겹, 야채 꽃살</span>
                </div>
            </div>
            <div class="item">
            <img src="/assets/image/logo.png" alt="대한옥">
                <div class="info">
                    <span>부일갈비</span>
                    <span>돼지갈비, 숯불갈비</span>
                </div>
                
            </div>
        </div>
      </div>  
  <div class="res_menu_wrap" >
        
            <div class="details">
                <h1>메뉴 정보</h1>
                <div class="share" onclick="location.href='/tastyForm/reservation.do'">
                예약하기
                </div>                
            </div>

        <div class="recommendations">
            <div class="item">
                <div class="info">
                    <span>짜장면</span>
                    <span>9000원</span>
                </div>
            </div>
            <div class="item">
                <div class="info">
                    <span>짬뽕</span>
                    <span>8000원</span>
                </div>
            </div>
            <div class="item">
                <div class="info">
                    <span>탕수육</span>
                    <span>15000원</span>
                </div>
                
            </div>
        </div>
        </div>
        
 </div>
    
<div class = "res_right_container">
    
    <div class="mapContainer" >
                <div id="map" style="width:200px;height:200px;"></div>
    </div>
   	<div class="res_review_wrap">
   		<div class="res_review_id">
   		1
		</div>   	
   		<div class="res_review_rating">
   		★  1
		</div>  
   		<div class="res_review_img">
            <img src="/assets/image/logo.png" alt="대한옥">
		</div>  
		 	
   		<div class="res_review_content">
   		alskjlasfjsafjalfjsalkfjalkfjalsfjalsfjslkafjal
		</div>
		   	
		
   	</div>

</div>



  
  </div>
  
 </div> 

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=597a12321ce91d26c9101324b5955ebd&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('경기도 안양시 만안구 안양4동 707-25', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">띵호</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>








  	
  
  
  
 
  
  <%@ include file="/views/common/footer.jsp"%>
  
   	<script src="/assets/js/bootstrap.bundle.min.js"></script>
   
<div class="bg"></div>
  </body>
</html>
