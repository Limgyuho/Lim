$('select[data-value]').each(function(index, item) {

	const items = $(item);

	const defaultValue = items.attr('data-value').trim();

	if (defaultValue.length > 0) {
		items.val(defaultValue);
	}
})

$('.modal-exam').click(function() {
	$('.layer-bg').show();
	$('.layer').show();
	//	$('.layer-bg, .layer').css('display', 'block');
})

$('.layer-bg').click(function() {
	$('.layer-bg').hide();
	$('.layer').hide();
	//	$('.layer-bg, .layer').css('display', 'none');
})

$('.close-btn').click(function() {
	$('.layer-bg').hide();
	$('.layer').hide();
	//	$('.layer-bg, .layer').css('display', 'none');
})

$('.close-x-btn').click(function() {
	$('.layer-bg').hide();
	$('.layer').hide();
	//	$('.layer-bg, .layer').css('display', 'none');
})

$('.Messenger').click(function() {
	let popOption = "width=650px, height=550px, top=100px, left=100px, scrollbars=yes";
	let openUrl = '/usr/chat/department';
	window.open(openUrl, 'pop', popOption);
})

$('.department').click(function() {
	var department = $(this).data('department');
	let popOption = "width=650px, height=550px, top=100px, left=100px, scrollbars=yes";
	let openUrl = '/usr/chat/members';
	window.open(openUrl, 'pop', popOption);
});

$('.low-1').click(function() {
	let popOption = "width=1000px, height=550px, top=100px, left=100px, scrollbars=yes";
	let openUrl = "https://www.law.go.kr/%EB%B2%95%EB%A0%B9/%EA%B3%B5%EB%AC%B4%EC%9B%90%ED%96%89%EB%8F%99%EA%B0%95%EB%A0%B9";
	window.open(openUrl, 'pop', popOption);
})

$('.low-2').click(function() {
	let popOption = "width=1000px, height=550px, top=100px, left=100px, scrollbars=yes";
	let openUrl = "https://www.law.go.kr/%EB%B2%95%EB%A0%B9/%EA%B5%AD%EA%B0%80%EA%B3%B5%EB%AC%B4%EC%9B%90%EB%B2%95";
	window.open(openUrl, 'pop', popOption);
})


$('.low-3').click(function() {
	let popOption = "width=1000px, height=550px, top=100px, left=100px, scrollbars=yes";
	let openUrl = "https://www.law.go.kr/%EB%B2%95%EB%A0%B9/%EC%84%B8%EC%A2%85%ED%8A%B9%EB%B3%84%EC%9E%90%EC%B9%98%EC%8B%9C%EC%A7%80%EC%9B%90%EC%9C%84%EC%9B%90%ED%9A%8C%EB%93%B1%EC%9D%98%EC%84%A4%EC%B9%98%EC%9A%B4%EC%98%81%EC%97%90%EA%B4%80%ED%95%9C%EA%B7%9C%EC%A0%95";
	window.open(openUrl, 'pop', popOption);
})
$('.low-4').click(function() {
	let popOption = "width=1000px, height=550px, top=100px, left=100px, scrollbars=yes";
	let openUrl = "https://www.law.go.kr/%EB%B2%95%EB%A0%B9/%EA%B3%B5%EB%AC%B4%EC%9B%90%EC%A7%81%EC%9E%A5%ED%98%91%EC%9D%98%ED%9A%8C%EC%9D%98%EC%84%A4%EB%A6%BD%E3%86%8D%EC%9A%B4%EC%98%81%EC%97%90%EA%B4%80%ED%95%9C%EB%B2%95%EB%A5%A0";
	window.open(openUrl, 'pop', popOption);
})




//이미지 슬라이드부분
$(document).ready(function() {
	var sliderWrapper = $(".slider-wrapper");
	var slideWidth = sliderWrapper.width() / 4;
	var slideIndex = 0;
	var totalSlides = 4; // 이미지의 총 개수

	$(".slider-button-prev").click(function() {
		slideIndex--;
		if (slideIndex < 0) {
			slideIndex = totalSlides - 1; // 첫 번째 이미지에서 이전 버튼을 누르면 마지막 이미지로 이동
		}
		updateSliderPosition();
	});

	$(".slider-button-next").click(function() {
		slideIndex++;
		if (slideIndex >= totalSlides) {
			slideIndex = 0; // 마지막 이미지에서 다음 버튼을 누르면 첫 번째 이미지로 이동
		}
		updateSliderPosition();
	});

	setInterval(function() {
		slideIndex++;
		if (slideIndex >= totalSlides) {
			slideIndex = 0; // 마지막 이미지에서 다음 버튼을 누르면 첫 번째 이미지로 이동
		}
		updateSliderPosition();
	}, 3000);

	function updateSliderPosition() {
		var leftPosition = -slideWidth * slideIndex;
		sliderWrapper.css("left", leftPosition);
	}
});

