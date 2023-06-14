<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	const API_KEY = 'en4c2vuVTyKygTbdDbBEUlqGqksHKZ9oJhjK03pzaXDa%2FxzAUkvW3nhf9QyNoBN1vT0gJvlhl0yxG9CTQ57VvA%3D%3D';

	async function gerDate() {
	  const url = 'http://apis.data.go.kr/1170000/law/lawSearchList.do' + API_KEY;

	  const response = await fetch(url);
	  const xmlText = await response.text();

	  const parser = new DOMParser();
	  const xmlDoc = parser.parseFromString(xmlText, 'text/xml');

	  const titles = xmlDoc.getElementsByTagName('title');
	  for (let i = 0; i < titles.length; i++) {
	    console.log(titles[i].textContent);
	  }
	}

	gerDate();


</script>
</body>
</html>