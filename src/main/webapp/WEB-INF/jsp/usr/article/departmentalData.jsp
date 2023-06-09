<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/head.jsp"%>
<%@ include file="../home/topbar.jsp"%>


<div class="flex mt-5 justify-center content-center h-screen">
	<div id="div1" class="flex w-80 h-96 border-black block">운영지원과
		<c:forEach var="file" items="${files2}">
			<ul>
				<li>
					<a href="/usr/article/file/${file.id}" download>
						${file.originName} <i class="fa-solid fa-download"></i>
					</a>
				</li>
			</ul>
		</c:forEach>
		<c:if test="${rq.getLoginedMember().getName() eq 'admin'}">
			<form id="form1" action="upload2" method="POST" enctype="multipart/form-data">
				<input type="file" name="file2" />
				<button onclick="upload('div1', 'form1')">업로드</button>
			</form>
		</c:if>
	</div>

	<div id="div2" class="flex w-80 h-96 border-black block">기획재정담당관
		<c:forEach var="file" items="${files2}">
			<ul>
				<li>
					<a href="/usr/article/file/${file.id}" download>
						${file.originName} <i class="fa-solid fa-download"></i>
					</a>
				</li>
			</ul>
		</c:forEach>
		<c:if test="${rq.getLoginedMember().getName() eq 'admin'}">
			<form id="form2" action="upload2" method="POST" enctype="multipart/form-data">
				<input type="file" name="file2" />
				<button onclick="upload('div2', 'form2')">업로드</button>
			</form>
		</c:if>
	</div>

	<div id="div3" class="flex w-80 h-96 border-black block">정보과
		<c:forEach var="file" items="${files2}">
			<ul>
				<li>
					<a href="/usr/article/file/${file.id}" download>
						${file.originName} <i class="fa-solid fa-download"></i>
					</a>
				</li>
			</ul>
		</c:forEach>
		<c:if test="${rq.getLoginedMember().getName() eq 'admin'}">
			<form id="form3" action="upload2" method="POST" enctype="multipart/form-data">
				<input type="file" name="file2" />
				<button onclick="upload('div3', 'form3')">업로드</button>
			</form>
		</c:if>
	</div>
	<div id="div4" class="flex w-80 h-96 border-black block">감사과
		<c:forEach var="file" items="${files2}">
			<ul>
				<li>
					<a href="/usr/article/file/${file.id}" download>
						${file.originName} <i class="fa-solid fa-download"></i>
					</a>
				</li>
			</ul>
		</c:forEach>
		<c:if test="${rq.getLoginedMember().getName() eq 'admin'}">
			<form id="form4" action="upload2" method="POST" enctype="multipart/form-data">
				<input type="file" name="file2" />
				<button onclick="upload('div4', 'form4')">업로드</button>
			</form>
		</c:if>
	</div>
		
</div>

<script>
  function upload(divId, formId) {
    var form = document.getElementById(formId);
    var files = form.file2.files;
    var div = document.getElementById(divId);
    var ul = div.getElementsByTagName('ul')[0];

    for (var i = 0; i < files.length; i++) {
      var li = document.createElement('li');
      var a = document.createElement('a');
      a.href = "/usr/article/file/" + i;
      a.download = files[i].name;
      a.innerHTML = files[i].name + ' <i class="fa-solid fa-download"></i>';
      li.appendChild(a);
      ul.appendChild(li);
    }
  }
</script>



<div class="fixed-bottom">
	<%@ include file="../common/bottom.jsp"%>
</div>