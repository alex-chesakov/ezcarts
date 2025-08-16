$(document).ready(function() {
	
	$('#open_mobile_menu').live("click",function(){
console.log('common #open_mobile_menu');
		if( $('#mobile_menu').hasClass('open') ){
			$('#mobile_menu').removeClass('open');
			$('.overlay').remove();
		}else{
			$('.overlay').remove();
			$('#mobile_menu').addClass('open');
			$('body').append('<div class="overlay fixed inset-0 bg-black/50 transition-opacity duration-300 ease-in-out z-[99998] opacity-100"></div>');
		}
	});
	$('.overlay').live("click",function(){
console.log('common .overlay');
		$('#mobile_menu').removeClass('open');
		$('.overlay').remove();
	});
	
	$('#menu > ul').superfish({
		pathClass	 : 'overideThisToUse',
		delay		 : 0,
		animation	 : {height: 'show'},
		speed		 : 'normal',
		autoArrows   : false,
		dropShadows  : false, 
		disableHI	 : false, /* set to true to disable hoverIntent detection */
		onInit		 : function(){},
		onBeforeShow : function(){},
		onShow		 : function(){},
		onHide		 : function(){}
	});
	
	$('#menu > ul').css('display', 'block');
	
	$('.dropdown_group button').live("click",function(){
console.log('common .dropdown_group-button');
		$(this).next().toggleClass('open');
	});
	$('.dropdown_group .dropdown input[type=radio]:checked').live("change",function(){
console.log('common .dropdown_group-dropdown-input');
		title = $(this).closest('label').find('.title_drop').html();
		$(this).closest('.dropdown_group').find('button[type=button]').find('span').html(title);
console.log('common .dropdown_group-dropdown-input hide');
		$(this).closest('.dropdown').removeClass('open');
	});
	$(document).on("click",function(e){
		if ( !$(".dropdown_group").is(e.target) && $(".dropdown_group").has(e.target).length === 0 ) {
console.log('common .dropdown_group-dropdown hide');
			$('.dropdown_group .dropdown').removeClass('open');
		}
	});
	
});
 
function getURLVar(key) {
	var value = [];
	
	var query = String(document.location).split('?');
	
	if (query[1]) {
		var part = query[1].split('&');

		for (i = 0; i < part.length; i++) {
			var data = part[i].split('=');
			
			if (data[0] && data[1]) {
				value[data[0]] = data[1];
			}
		}
		
		if (value[key]) {
			return value[key];
		} else {
			return '';
		}
	}
} 

$(document).ready(function() {
	route = getURLVar('route');
	
	if (!route) {
		$('#dashboard').addClass('selected');
	} else {
		part = route.split('/');
		
		url = part[0];
		
		if (part[1]) {
			url += '/' + part[1];
		}
		
		$('a[href*=\'' + url + '\']').parents('li[id]').addClass('selected');
	}
	
	$('#menu ul li').on('click', function() {
		$(this).addClass('hover');
	});

	$('#menu ul li').on('mouseout', function() {
		$(this).removeClass('hover');
	});	
});
