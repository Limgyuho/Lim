<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../common/head.jsp" %>
<%@ include file="../home/topbar.jsp" %>

<script>

	function xmlTest() {
		xmlData = `
			<?xml version="1.0" encoding="UTF-8"?>
			<root>
				<person>
					<age>22</age>
					<name>홍길동</name>
				</person>
				<person>
					<age>25</age>
					<name>이순신</name>
				</person>
			</root>
		`


		const parser = new DOMParser();
	    const xmlDoc = parser.parseFromString(xmlData, 'text/xml');
		console.log(xmlDoc);
	    //const cntHospitalizationsElement = xmlDoc.querySelector('searchKeyword');
	}

	const ServiceKey = 'en4c2vuVTyKygTbdDbBEUlqGqksHKZ9oJhjK03pzaXDa%2FxzAUkvW3nhf9QyNoBN1vT0gJvlhl0yxG9CTQ57VvA%3D%3D';

	const query = '*';
	const target = 'licbyl';
	const numOfRows = '10';
	const pageNo = '10';

	async function getData() {
	    const url = 'http://apis.data.go.kr/1170000/law/expcSearchList.do?ServiceKey=' + ServiceKey + '&query=' + query + '&target=' + target + '&numOfRows=' + numOfRows + '&pageNo=' + pageNo;

	    const response = await fetch(url);
	    const xmlText = await response.text();

	    keyword = document.getElementById("keyword").value;
	    
	    const parser = new DOMParser();
	    const xmlDoc = parser.parseFromString(xmlText, 'text/xml');
	    
	    console.log(keyword);
	    const cntHospitalizationsElement = xmlDoc.querySelector(keyword);	    
	    	    
	    if (cntHospitalizationsElement) {
	        const cntHospitalizations = cntHospitalizationsElement.textContent;
	        console.log(cntHospitalizations);
	        

	        const contentDiv = document.querySelector('.API-content');
	        contentDiv.textContent = cntHospitalizations; // 데이터를 텍스트로 할당

	        // 또는 데이터를 HTML로 할당하려면:
	        // contentDiv.innerHTML = cntHospitalizations;
	        
	        targetDiv = querySelector(".API-content");
	        
	        
	    } else {
	        console.log('Error: cnt_hospitalizations element not found in XML');
	    }
	}
	
	getData().catch((error) => {	
	    console.log('Error during API call:', error);
	});
	
	xmlTest();
</script>

<div class="container mx-auto">
	<div class="search">
		<input type="text" id="keyword" name="keyword"  placeholder="검색" />
		<input type="button" value="검색"  onclick="getData();" />
	</div>
    <div>APITest입니다</div>
    <div class="API-content"></div>
</div>
