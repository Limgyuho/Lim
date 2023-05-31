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

//$('.transfer').click(function() {
//	var department = $(this).data('loginId');
//	let popOption = "width=650px, height=550px, top=100px, left=100px, scrollbars=yes";
//	let openUrl = '/usr/admin/transfer';
//	window.open(openUrl, 'pop', popOption);
//});
//



