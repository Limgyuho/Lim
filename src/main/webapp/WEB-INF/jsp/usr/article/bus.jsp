<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<%@ include file="../home/topbar.jsp"%>


<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <div id="mapContainer" style="width: 500px; height: 400px;"></div>
    </div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1fe1923de2e82c0ac685df4ed7ab5021"></script>

<script>
    function openKakaoMap() {
        var modal = document.getElementById('myModal'); // 모달 창
        var mapContainer = document.getElementById('mapContainer'); // 지도를 표시할 div

        modal.style.display = "block";

        var mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

        // 마커가 표시될 위치입니다
        var markerPosition = new kakao.maps.LatLng(33.450701, 126.570667);

        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            position: markerPosition
        });

        // 마커가 지도 위에 표시되도록 설정합니다
        marker.setMap(map);

        // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
        // marker.setMap(null);
    }

    function closeModal() {
        var modal = document.getElementById('myModal'); // 모달 창

        // 모달 창을 숨깁니다.
        modal.style.display = "none";
    }
</script>

<div class="flex justify-end w-3/5 border-red m-16">
    <div class="tbl_st tbl_busRut" style="border: 1px solid black;">
        <p class="pc_navy"></p>
        <table style="border-collapse: collapse; width: 100%;">
            <caption>노선 조치원(A)→청사의 경유지 및 운행시간에 대한 정보를 제공합니다</caption>
            <colgroup>
                <col style="width: auto;">
            </colgroup>
            <thead>
                <tr>
                    <th colspan="7" style="border: 1px solid black;">운행시간</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                     <td>
                        <button class="pointer" onclick="openKakaoMap()">모아 할인마트 앞</button>
                    </td>
					<td class="pointer" onclick="fn_showVialocInfo('7','22')"
						style="border: 1px solid black;">조치원역 (종로약국 건너편 버스정류장 앞)</td>
					<td class="pointer" onclick="fn_showVialocInfo('7','23')"
						style="border: 1px solid black;">(구)효성병원 전방 50m (영진카오디오)</td>
					<td class="pointer" onclick="fn_showVialocInfo('7','24')"
						style="border: 1px solid black;">죽림삼거리 (파밀리에@ 앞)</td>
					<td class="pointer" onclick="fn_showVialocInfo('7','25')"
						style="border: 1px solid black;">홈플러스 건너편</td>
					<td class="pointer" onclick="fn_showVialocInfo('7','26')"
						style="border: 1px solid black;">현대중전기앞</td>
					<td class="pointer" onclick="fn_showVialocInfo('7','29')"
						style="border: 1px solid black;">세종청사</td>
				</tr>
				<tr>
					<td style="border: 1px solid black;">08:10</td>
					<td style="border: 1px solid black;">08:15</td>
					<td style="border: 1px solid black;">08:17</td>
					<td style="border: 1px solid black;">08:19</td>
					<td style="border: 1px solid black;">08:21</td>
					<td style="border: 1px solid black;">08:22</td>
					<td style="border: 1px solid black;">08:50</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div class="flex justify-end w-3/5 border-red m-16">
	<div class="tbl_st tbl_busRut">

		<table>
			<caption>노선 조치원(B)→청사의 경유지 및 운행시간에 대한 정보를 제공합니다</caption>
			<colgroup>
				<col style="width: auto;">
			</colgroup>
			<thead>
				<tr>
					<th colspan="7">운행시간</th>
				</tr>
			</thead>
			<tbody>
				<tr>

					<td class="pointer" onclick="fn_showVialocInfo('8','30')"
					style="border: 1px solid black;">신안리
						요양병원 앞</td>

					<td class="pointer" onclick="fn_showVialocInfo('8','31')" style="border: 1px solid black;">욱일삼거리
						(LG전자 앞)</td>

					<td class="pointer" onclick="fn_showVialocInfo('8','32')" style="border: 1px solid black;">신흥사거리
						(육교 앞)</td>

					<td class="pointer" onclick="fn_showVialocInfo('8','33')" style="border: 1px solid black;">LG자이@
						(118동 앞)</td>

					<td class="pointer" onclick="fn_showVialocInfo('8','34')" style="border: 1px solid black;">봉암리
						(윤가네 들깨수제비)</td>

					<td class="pointer" onclick="fn_showVialocInfo('8','35')" style="border: 1px solid black;">연기우편
						취급소</td>

					<td class="pointer" onclick="fn_showVialocInfo('8','38')" style="border: 1px solid black;">세종청사</td>

				</tr>

				<tr>

					<td style="border: 1px solid black;">07:45</td>

					<td style="border: 1px solid black;">07:50</td>

					<td style="border: 1px solid black;">07:53</td>

					<td style="border: 1px solid black;">07:55</td>

					<td style="border: 1px solid black;">08:00</td>

					<td style="border: 1px solid black;">08:05</td>

					<td style="border: 1px solid black;">08:25</td>

				</tr>

			</tbody>
		</table>
	</div>
</div>

<div class="flex justify-end w-3/5 border-red m-16">
	<div class="tbl_st tbl_busRut">

		<table>
			<caption>노선 대전 동구→세종청사의 경유지 및 운행시간에 대한 정보를 제공합니다</caption>
			<colgroup>
				<col style="width: auto;">
			</colgroup>
			<thead>
				<tr>
					<th colspan="9">운행시간</th>
				</tr>
			</thead>
			<tbody>
				<tr>

					<td class="pointer" onclick="fn_showVialocInfo('9','39')" style="border: 1px solid black;">대전역
						서광장 건너편 (국제교류센터앞)</td>

					<td class="pointer" onclick="fn_showVialocInfo('9','40')" style="border: 1px solid black;">구
						대전방송 앞 (우성유통)</td>

					<td class="pointer" onclick="fn_showVialocInfo('9','41')" style="border: 1px solid black;">가오주공@
						(농협 앞)</td>

					<td class="pointer" onclick="fn_showVialocInfo('9','42')" style="border: 1px solid black;">동구청
						건너편 (버스정류장)</td>

					<td class="pointer" onclick="fn_showVialocInfo('9','43')" style="border: 1px solid black;">판암역
						(2번출구)</td>

					<td class="pointer" onclick="fn_showVialocInfo('9','44')" style="border: 1px solid black;">용운동주공@
						(115동 정문)</td>

					<td class="pointer" onclick="fn_showVialocInfo('9','45')" style="border: 1px solid black;">판암@4․5단지
						(큰빛교회 앞)</td>

					<td class="pointer" onclick="fn_showVialocInfo('9','46')" style="border: 1px solid black;">세종2청사
						(국세청 앞)</td>

					<td class="pointer" onclick="fn_showVialocInfo('9','47')"style="border: 1px solid black;">세종청사</td>

				</tr>

				<tr>

					<td style="border: 1px solid black;">07:15</td>

					<td style="border: 1px solid black;">07:17</td>

					<td style="border: 1px solid black;">07:20</td>

					<td style="border: 1px solid black;">07:25</td>

					<td style="border: 1px solid black;">07:27</td>

					<td style="border: 1px solid black;">07:30</td>

					<td style="border: 1px solid black;">07:33</td>

					<td style="border: 1px solid black;">08:16</td>

					<td style="border: 1px solid black;">08:25</td>

				</tr>

			</tbody>
		</table>
	</div>
</div>

<div class="flex justify-end w-3/5 border-red m-16">
	<div class="tbl_st tbl_busRut">

		<table>
			<caption>노선 대전 서구→세종청사의 경유지 및 운행시간에 대한 정보를 제공합니다</caption>
			<colgroup>
				<col style="width: auto;">
			</colgroup>
			<thead>
				<tr>
					<th colspan="8">운행시간</th>
				</tr>
			</thead>
			<tbody>
				<tr>

					<td class="pointer" onclick="fn_showVialocInfo('13','71')" style="border: 1px solid black;">건양대사거리
						리슈빌@ 앞 (버스정류장)</td>

					<td class="pointer" onclick="fn_showVialocInfo('13','72')" style="border: 1px solid black;">수묵토@
						104동 앞 (버스정류장)</td>

					<td class="pointer" onclick="fn_showVialocInfo('13','73')" style="border: 1px solid black;">도안신도시
						금성백조@ 어울림@ 사거리 옆 도로</td>

					<td class="pointer" onclick="fn_showVialocInfo('13','74')" style="border: 1px solid black;">트리플시티9단지
						버스정류장 (원골육교 근처)</td>

					<td class="pointer" onclick="fn_showVialocInfo('13','75')" style="border: 1px solid black;">휴먼시아6단지
						센트럴시티 (롯데리아 근처)</td>

					<td class="pointer" onclick="fn_showVialocInfo('13','76')" style="border: 1px solid black;">반석역
						(5번출구)</td>

					<td class="pointer" onclick="fn_showVialocInfo('13','77')" style="border: 1px solid black;">세종2청사
						(국세청앞)</td>

					<td class="pointer" onclick="fn_showVialocInfo('13','78')" style="border: 1px solid black;">세종청사</td>

				</tr>

				<tr>

					<td style="border: 1px solid black;">07:20</td>

					<td style="border: 1px solid black;">07:23</td>

					<td style="border: 1px solid black;">07:30</td>

					<td style="border: 1px solid black;">07:35</td>

					<td style="border: 1px solid black;">07:37</td>

					<td style="border: 1px solid black;">07:57</td>

					<td style="border: 1px solid black;">08:13</td>

					<td style="border: 1px solid black;">08:22</td>

				</tr>

				<tr>

					<td style="border: 1px solid black;">07:25</td>

					<td style="border: 1px solid black;">07:28</td>

					<td style="border: 1px solid black;">07:35</td>

					<td style="border: 1px solid black;">07:40</td>

					<td style="border: 1px solid black;">07:42</td>

					<td style="border: 1px solid black;">08:02</td>

					<td style="border: 1px solid black;"></td>

					<td style="border: 1px solid black;">08:25</td>

				</tr>

				<tr>

					<td style="border: 1px solid black;">07:30</td>

					<td style="border: 1px solid black;">07:33</td>

					<td style="border: 1px solid black;">07:40</td>

					<td style="border: 1px solid black;">07:45</td>

					<td style="border: 1px solid black;">07:47</td>

					<td style="border: 1px solid black;">08:07</td>

					<td style="border: 1px solid black;"></td>

					<td style="border: 1px solid black;">08:30</td>

				</tr>

			</tbody>
		</table>
	</div>
</div>

<div class="flex justify-end w-3/5 border-red m-16">
	<div class="tbl_st tbl_busRut">

		<table>
			<caption>노선 대전 둔산 → 세종청사(1)의 경유지 및 운행시간에 대한 정보를 제공합니다</caption>
			<colgroup>
				<col style="width: auto;">
			</colgroup>
			<thead>
				<tr>
					<th colspan="8">운행시간</th>
				</tr>
			</thead>
			<tbody>
				<tr>

					<td class="pointer" onclick="fn_showVialocInfo('15','86')">샘머리@
						209동 앞</td>

					<td class="pointer" onclick="fn_showVialocInfo('15','87')">만년네거리
						상록수@ 105동</td>

					<td class="pointer" onclick="fn_showVialocInfo('15','88')">다모아@
						111동 건너편</td>

					<td class="pointer" onclick="fn_showVialocInfo('15','89')">궁동사거리
						버스정류장</td>

					<td class="pointer" onclick="fn_showVialocInfo('15','90')">죽동삼거리</td>

					<td class="pointer" onclick="fn_showVialocInfo('15','91')">한빛식물원
						버스정류장</td>

					<td class="pointer" onclick="fn_showVialocInfo('15','92')">반석역</td>

					<td class="pointer" onclick="fn_showVialocInfo('15','93')">세종청사</td>

				</tr>

				<tr>

					<td>07:10</td>

					<td>07:13</td>

					<td>07:16</td>

					<td>07:21</td>

					<td>-</td>

					<td>07:24</td>

					<td>07:26</td>

					<td>07:54</td>

				</tr>

				<tr>

					<td>07:40</td>

					<td>07:43</td>

					<td>07:47</td>

					<td>07:55</td>

					<td>07:57</td>

					<td>07:58</td>

					<td>08:00</td>

					<td>08:28</td>

				</tr>

			</tbody>
		</table>
	</div>
</div>

<div class="flex justify-end w-3/5 border-red m-16">
	<div class="tbl_st tbl_busRut">

		<table>
			<caption>노선 대전 둔산 → 세종청사(2)의 경유지 및 운행시간에 대한 정보를 제공합니다</caption>
			<colgroup>
				<col style="width: auto;">
			</colgroup>
			<thead>
				<tr>
					<th colspan="7">운행시간</th>
				</tr>
			</thead>
			<tbody>
				<tr>

					<td class="pointer" onclick="fn_showVialocInfo('16','94')">샘머리@
						209동 앞</td>

					<td class="pointer" onclick="fn_showVialocInfo('16','95')">만년네거리
						상록수@ 105동</td>

					<td class="pointer" onclick="fn_showVialocInfo('16','96')">다모아@
						111동 건너편</td>

					<td class="pointer" onclick="fn_showVialocInfo('16','97')">궁동사거리
						버스정류장</td>

					<td class="pointer" onclick="fn_showVialocInfo('16','98')">죽동삼거리</td>

					<td class="pointer" onclick="fn_showVialocInfo('16','99')">반석역</td>

					<td class="pointer" onclick="fn_showVialocInfo('16','101')">세종청사</td>

				</tr>

				<tr>

					<td>07:25</td>

					<td>07:28</td>

					<td>07:31</td>

					<td>07:36</td>

					<td>07:38</td>

					<td>07:45</td>

					<td>08:13</td>

				</tr>

				<tr>

					<td>07:35</td>

					<td>07:38</td>

					<td>07:41</td>

					<td>07:46</td>

					<td></td>

					<td>07:54</td>

					<td>08:22</td>

				</tr>

			</tbody>
		</table>
	</div>
</div>

<style>
body {
	margin: 0;
	padding: 0;
	font-family: 'NotoSans', '돋움', 'Dotum', '굴림', 'Gulim', AppleGothic,
		UnDotum, Arial, Tahoma, Verdana, sans-serif;
	font-weight: 400;
	font-size: 0.75rem;
	color: #666;
	letter-spacing: -0.5px;
}
</style>

<style>
.modal {
    display: none;
    position: fixed;
    z-index: 9999;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(255, 0, 0, 0.4);
}

.modal-content {
    background-color: #cbcbcb;
    margin: 15% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
    max-width: 600px;
}

.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
    cursor: pointer;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}
</style>
<%@ include file="../common/bottom.jsp"%>
