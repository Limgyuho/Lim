<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../common/head.jsp" %>
<%@ include file="../home/topbar.jsp" %>

<script>
	const ServiceKey = 'en4c2vuVTyKygTbdDbBEUlqGqksHKZ9oJhjK03pzaXDa%2FxzAUkvW3nhf9QyNoBN1vT0gJvlhl0yxG9CTQ57VvA%3D%3D';

	const query = '*';
	const target = 'licbyl';
	const numOfRows = '10';
	const pageNo = '10';

	async function getData() {
	    const url = 'http://apis.data.go.kr/1170000/law/expcSearchList.do?ServiceKey=' + ServiceKey + '&query=' + query + '&target=' + target + '&numOfRows=' + numOfRows + '&pageNo=' + pageNo;

	    const response = await fetch(url);
	    const xmlText = await response.text();

	    console.log(xmlText);

	    const parser = new DOMParser();
	    const xmlDoc = parser.parseFromString(xmlText, 'text/xml');

	    const cntHospitalizationsElement = xmlDoc.querySelector('cnt_hospitalizations');
	    if (cntHospitalizationsElement) {
	        const cntHospitalizations = cntHospitalizationsElement.textContent;
	        console.log(cntHospitalizations);

	        const contentDiv = document.querySelector('.API-content');
	        contentDiv.textContent = cntHospitalizations; // 데이터를 텍스트로 할당

	        // 또는 데이터를 HTML로 할당하려면:
	        // contentDiv.innerHTML = cntHospitalizations;
	    } else {
	        console.log('Error: cnt_hospitalizations element not found in XML');
	    }
	}
	getData();
	
	getData().catch((error) => {
	    console.log('Error during API call:', error);
	});
</script>

<div class="container mx-auto">
    <div>APITest입니다</div>
    <div class="API-content"></div>
</div>
