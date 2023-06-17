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

