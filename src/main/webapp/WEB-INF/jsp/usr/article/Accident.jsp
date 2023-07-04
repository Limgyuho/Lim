<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/head.jsp"%>
<%@ include file="../home/topbar.jsp"%>


<div class="text-center text-4xl">
	<label for="pageSelect text-4xl">카테고리를 선택하세요:</label> <select
		class="select select-bordered" id="pageSelect"
		onchange="redirectToPage()">

		<option value="http://localhost:8085/usr/article/welfare">연금복지 제도</option>
		<option value="http://localhost:8085/usr/article/recruitment">성과보수 제도</option>
		<option value="http://localhost:8085/usr/article/Accident" selected>재해보상 제도</option>
	</select>
</div>

<div class="rounded-lg border border-gray-300 w-7/12 m-auto">

	<dl class="qna-wrap">
		<dt class="question">
			<!-- 질문 -->

			<a href="#none" onclick="javascript:opendata(32)"><i>[질문]</i>(순직,
				위험직무순직) 순직이나 위험직무순직을 인정받아야 국립묘지에 안장될 수 있나요?</a>



		</dt>

		<dd class="answer" id="g32" style="display: none;">
			<!-- 답변 -->
			<i>[답변]</i>
			<p>
				아닙니다.<strong> 국립묘지 안장은 국립묘지법 제5조에 해당되는지 여부에 따라 결정</strong>되며,<strong>
					순직 및 위험직무순직의 인정여부와 직접적인 관련이 없습니다</strong>. 국립묘지 안장은 「국립묘지의 설치 및 운영에 관한 법률」에
				따라 국가보훈처 안장대상심의위원회의 심의를 거쳐 결정됩니다.
			</p>
		</dd>
	</dl>

	<dl class="qna-wrap">



		<dt class="question">
			<!-- 질문 -->

			<a href="#none" onclick="javascript:opendata(31)"><i>[질문]</i>(급여청구)
				급여 결정에 이의가 있는 경우에는 어떻게 하나요?</a>

		</dt>

		<dd class="answer" id="g31" style="display: none;">
			<!-- 답변 -->
			<i>[답변]</i>
			<p>
				결정 등이 있었던 날부터 180일, 그 사실을 안 날(결정서를 송부 받은 날)로부터 90일 이내에 공무원재해보상연금위원회에
				심사를 청구할 수 있습니다. <br>다만, 공무원재해보상연금위원회의 심사를 거치지 않고 바로 행정소송을 제기할
				수도 있습니다. 이때에도 행정소송법 제20조 제1항에 따라 결정 등이 있었던 날부터 1년, 결정서를 송부 받은 날로부터
				90일 이내에 행정소송을 제기하여야 합니다.
			</p>
		</dd>
	</dl>

	<dl class="qna-wrap">



		<dt class="question">
			<!-- 질문 -->
			<a href="#none" onclick="javascript:opendata(30)"><i>[질문]</i>(급여청구)
				급여청구에 대한 결정서를 직접 출력할 수 있나요?</a>


		</dt>

		<dd class="answer" id="g30" style="display: none;">
			<!-- 답변 -->
			<i>[답변]</i>
			<p>
				네, 출력이 가능합니다. 본인의 공인인증서를 이용하여 공무원연금공단 홈페이지(<a
					href="http://www.geps.or.kr">www.geps.or.kr</a>)에 접속하신 후 「<strong>현직공무원-내
					연금 알아보기-재해보상-재해보상급여-재해보상 결정통보서 조회 및 출력</strong>」에서 직접 출력 가능합니다.
			</p>
		</dd>
	</dl>

	<dl class="qna-wrap">
		<dt class="question">
			<!-- 질문 -->

			<a href="#none" onclick="javascript:opendata(29)"><i>[질문]</i>(심의회
				심의) 공무원재해보상심의회에 출석하여 진술할 수 있나요?</a>
		</dt>

		<dd class="answer" id="g29" style="display: none;">
			<!-- 답변 -->
			<i>[답변]</i>
			<p>
				모든 심의에 출석하여 진술할 수 있는 것은 아닙니다. <strong>위험직무순직 유족급여에 한하여
					출석진술을 부여하고 있습니다.</strong>
			</p>
		</dd>
	</dl>

	<dl class="qna-wrap">
		<dt class="question">
			<!-- 질문 -->

			<a href="#none" onclick="javascript:opendata(28)"><i>[질문]</i>(심의회
				심의) 공무원재해보상심의회의 심사결과는 언제 알 수 있나요?</a>
		</dt>

		<dd class="answer" id="g28" style="display: none;">
			<!-- 답변 -->
			<i>[답변]</i>
			<p>
				심사 완료 여부는 <strong>심사일 다음날 문자로 통보</strong>가 되며, <strong>결정서</strong>는
				<strong>공무원재해보상심의회 개최일로부터 14일 전후 우편으로 발송됩니다</strong>.
			</p>
		</dd>
	</dl>

	<dl class="qna-wrap">
		<dt class="question">
			<!-- 질문 -->
			<a href="#none" onclick="javascript:opendata(27)"><i>[질문]</i>(공무상
				요양) 공무관련성은 어떤 의미인가요?</a>
		</dt>

		<dd class="answer" id="g27" style="display: none;">
			<!-- 답변 -->
			<i>[답변]</i>
			<p>
				<strong>재해의 원인이 된 업무</strong>가 사적인 행위가 아닌 <strong>공적인 업무인지</strong>를
				판단하는 것을 의미합니다.<br>공무상 재해로 인정받기 위해서는 재해를 입은 원인인 업무 행위가 공무원 재해보상법
				제4조에 따른 공무관련성이 있어야 합니다. 공무수행 중 입은 재해가 아닌 사적(私的)행위 도중 입은 재해는 공무상 재해로
				인정받기 어렵습니다.
			</p>
		</dd>
	</dl>

	<dl class="qna-wrap">
		<dt class="question">
			<!-- 질문 -->
			<a href="#none" onclick="javascript:opendata(26)"><i>[질문]</i>(급여청구)
				공무원연금공단에 급여청구 후 결정될 때까지 어느 정도 시간이 소요되나요?</a>


		</dt>

		<dd class="answer" id="g26" style="display: none;">
			<!-- 답변 -->
			<i>[답변]</i>
			<p>
				<strong>평균적으로 1~2달 내외</strong>에서 결정되고 있으나, <strong>안건에 따라
					소요시간의 편차</strong>가 있습니다.
			</p>
		</dd>
	</dl>

	<dl class="qna-wrap">
		<dt class="question">
			<!-- 질문 -->

			<a href="#none" onclick="javascript:opendata(25)"><i>[질문]</i>(급여청구)
				급여청구 안건의 진행상황을 알 수 있나요?</a>

		</dt>

		<dd class="answer" id="g25" style="display: none;">
			<!-- 답변 -->
			<i>[답변]</i>
			<p>
				네, 진행상황을 알 수 있습니다. 현재,<strong> 안건접수/서류보완/심의완료 단계마다 SMS가 발송</strong>되어
				진행상황을 확인할 수 있습니다.
			</p>
			<br>
			<p>참고로 재해보상포털 구축 이후에는 청구인이 직접 인터넷상에서 진행상황을 확인할 수 있습니다.(’20년 3월
				예정)</p>
		</dd>
	</dl>

	<dl class="qna-wrap">
		<dt class="question">
			<!-- 질문 -->

			<a href="#none" onclick="javascript:opendata(24)"><i>[질문]</i>(요양급여)
				요양급여와 장해급여, 요양급여와 유족급여를 동시에 청구할 수 있나요?</a>


		</dt>

		<dd class="answer" id="g24" style="display: none;">
			<!-- 답변 -->
			<i>[답변]</i>
			<p>
				<strong>네, 두 종류의 급여를 동시에 청구하실 수 있습니다.</strong> 예를 들어, 과로로 인한 지주막하
				출혈이 발생되어 상당기간 치료 이후 사망하였다면, 치료비를 청구하는 요양급여와 사망에 대한 유족급여를 동시에 청구할 수
				있습니다.
			</p>
		</dd>
	</dl>

	<dl class="qna-wrap">

		<dt class="question">
			<!-- 질문 -->

			<a href="#none" onclick="javascript:opendata(23)"><i>[질문]</i>(급여청구)
				급여청구서의 양식은 어디에서 받을 수 있나요?</a>

		</dt>

		<dd class="answer" id="g23" style="display: none;">
			<!-- 답변 -->
			<i>[답변]</i>
			<p>
				급여청구서는 <strong>공무원연금공단 홈페이지(민원상담-각종서식-재해보상서식)</strong>에서 다운로드 받으실 수
				있습니다.
			</p>
		</dd>
	</dl>

	<dl class="qna-wrap">

		<dt class="question">
			<!-- 질문 -->

			<a href="#none" onclick="javascript:opendata(22)"><i>[질문]</i>(급여청구)
				공무상 재해에 대한 급여청구는 어떻게 하면 되나요?</a>

		</dt>

		<dd class="answer" id="g22" style="display: none;">
			<!-- 답변 -->
			<i>[답변]</i>
			<p>
				공무상 재해를 입은 공무원은<strong> 소속기관장의 확인을 받아 공무원연금공단에 청구</strong>할 수 있으며, <strong>공무원
					본인이 바로 공무원연금공단에 청구</strong>할 수도 있습니다. <br>다만, 공무원 본인이 소속기관장 확인 없이
				공무원연금공단에 직접 접수한 경우에는 공무원연금공단이 사후에 소속기관장의 확인을 거치게 됩니다.
			</p>
		</dd>
	</dl>

	<dl class="qna-wrap">
		<dt class="question">
			<!-- 질문 -->


			<a href="#none" onclick="javascript:opendata(21)"><i>[질문]</i>(위원회
				심사) 공무원재해보상연금위원회의 결정서가 청구인에게 송달되지 않은 경우 어떻게 하나요?</a>


		</dt>

		<dd class="answer" id="g21" style="display: none;">
			<!-- 답변 -->
			<i>[답변]</i>
			<p>
				공무원재해보상연금위원회에서 <strong>결정서를 여러 차례 우편 발송</strong>하여도 수취인 불명 등의 사유로 <strong>송달이
					되지 않는 경우</strong>, 행정심판법 제57조, 민사소송법 제194조 및 제196조에 따라 <strong>공시송달</strong>을
				합니다.
			</p>
			<br>
			<p>
				<strong>2회 이상 결정서가 반송되는 경우, 공무원재해보상연금위원회 홈페이지(<a
					href="/simsa">www.mpm.go.kr/simsa</a>) 게시판에 공시송달문을 게시하고, 피청구인에게
					공시송달 사항을 안내합니다.
				</strong>
			</p>
		</dd>
	</dl>

	<dl class="qna-wrap">



		<dt class="question">
			<!-- 질문 -->


			<a href="#none" onclick="javascript:opendata(20)"><i>[질문]</i>(공무상
				요양) 체육행사, 동호회 활동 중 발생한 재해로 부상을 입은 경우에도 공무상 요양 신청이 가능한가요?</a>

		</dt>

		<dd class="answer" id="g20" style="display: none;">
			<!-- 답변 -->
			<i>[답변]</i>
			<p>
				네, 가능합니다. <strong>소속기관장의 지배관리</strong> 하에 발생한 공식적인 체육행사, 동호회 활동 중에
				부상을 입었다면, 공무상 요양을 신청할 수 있습니다.
			</p>
		</dd>
	</dl>

	<dl class="qna-wrap">



		<dt class="question">
			<!-- 질문 -->
			<a href="#none" onclick="javascript:opendata(19)"><i>[질문]</i>(공무상
				요양) 회식 중 또는 회식 후 귀가하다가 재해를 입은 경우에도 공무상 요양을 신청할 수 있나요?</a>


		</dt>

		<dd class="answer" id="g19" style="display: none;">
			<!-- 답변 -->
			<i>[답변]</i>
			<p>
				네, 신청할 수 있습니다. 다만, <strong>공무 관련성이 있으며, 해당 소속기관의 공식적인 회식 중
					또는 회식 후 귀갓길에 발생한 재해에 한하여 공무상 요양 신청을 할 수 있습니다.</strong>
			</p>
			<br>
			<p>반면, 사전에 계획없이 사적인 SNS으로 연락하여 사비로 계산한 회식은 공무와 무관한 회식이며, 이 때 발생한
				사고로 부상을 당했다면 공무상 요양을 신청할 수 없습니다,</p>
		</dd>
	</dl>

	<dl class="qna-wrap">

		<dt class="question">
			<!-- 질문 -->

			<a href="#none" onclick="javascript:opendata(18)"><i>[질문]</i>(공무상
				요양) 출·퇴근 중 사고로 부상을 입은 경우에도 공무상 요양 신청이 가능한가요?</a>


		</dt>

		<dd class="answer" id="g18" style="display: none;">
			<!-- 답변 -->
			<i>[답변]</i>
			<p>네, 가능합니다. 다만, 공무상 요양을 신청하기 위해서는 통상적인 경로와 방법에 따른 출·퇴근이어야 합니다.
				통상적인 경로란 사회통념 상 이용할 수 있는 출·퇴근길을 의미하며, 통상적인 방법이란 사회통념 상 인정되는 교통수단을
				합리적으로 이용하는 것을 말합니다.</p>
		</dd>
	</dl>
</div>


<%@ include file="../common/bottom.jsp"%>
<script>
	function opendata(id) {
		var answer = document.getElementById("g" + id);
		if (answer.style.display === "none") {
			answer.style.display = "block";
		} else {
			answer.style.display = "none";
		}
	}
	  function redirectToPage() {
	      var selectBox = document.getElementById("pageSelect");
	      var selectedValue = selectBox.options[selectBox.selectedIndex].value;
	      
	      if (selectedValue !== "") {
	          window.location.href = selectedValue;
	      }
	  }
</script>

<style>
.qna-wrap dt {

	padding: 15px 15px 15px 55px;
	background: url(../images/content/bullet_q.png) no-repeat 15px 11px;
	cursor: pointer;
}

body, div, dl, dt, dd, ul, ol, li, pre, code, fieldset, legend, input,
	button, textarea, p, blockquote, th, td, select {
	font-size: 15px;
	line-height: 1.6;
	letter-spacing: 0.001em;
	color: #494949;
}

* {
	margin: 0;
	padding: 0;
	-webkit-text-size-adjust: none;
}

.qna-wrap dt {
	padding: 15px 15px 15px 55px;
	background: url(../images/content/bullet_q.png) no-repeat 15px 11px;
	cursor: pointer;
}

.qna-wrap dd {
	padding: 15px 15px 15px 55px;
	font-size: 15px;
	line-height: 22px;
	color: #66727f;
	border-top: 1px solid #e8e8e8;
}
</style>