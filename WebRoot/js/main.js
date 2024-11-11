/*********************************************************************************

	Template Name: 同城上门维修平台
	Description: A perfect template to build beautiful and unique eCommerce websites. It comes with nice and clean design.
	Version: 1.0

	Note: This is main js.

**********************************************************************************/

/**************************************************************
	
	STYLESHEET INDEXING
	|
	|
	|___ Sticky Header
	|___ Hero Area Slider Active
	|___ Products Slider Active
	|___ Blog Slider Active
	|___ Similliar Products Slider Active
	|___ Product Details Images Slider
	|___ Nice Select Activation
	|___ Bootstrap4 Tooltip Active
	|___ Mobile Menu
	|___ Product Quantity 
	|___ Product Details Color & Size 
	|___ Product Popup
	|___ Quick View Modal
	|___ Rating Hover Action
	|___ Range Slider Active
	|___ Scroll Up
	|___ Progress Bar Effect 
	|___ Checkout Login Coupon 
	|___ Different Address Form
	|___ Header Searchbox
	|___ Header Minicart
	|___ Ajax Chimp
	|___ Data View Mode
	|___ Widget Category Menu
	|
	|
	|___ END STYLESHEET INDEXING

***************************************************************/


(function($){
    'use strict';
	


	/* Sticky Header */
	$(window).on('scroll', function () {
		var scrollPos = $(this).scrollTop();
		if (scrollPos > 300) {
			$('.sticky-header').addClass('is-sticky');
		} else {
			$('.sticky-header').removeClass('is-sticky');
		}
	});




	/* Hero Area Slider Active */
	$('.hero-area').slick({
		slidesToShow: 1,
		autoplay: true,
		autoplaySpeed: 8000,
		adaptiveHeight: true,
		dots: false,
		arrows: true,
		fade: true,
		easing: 'ease-in-out',
		speed: 1000,
		prevArrow: '<span class="slider-navigation slider-navigation-prev"><i class="ti ti-angle-left"></i></span>',
		nextArrow: '<span class="slider-navigation slider-navigation-next"><i class="ti ti-angle-right"></i></span>',
	});



	/* Products Slider Active */
	$('.products-slider-active').slick({
		slidesToShow: 4,
		autoplay: true,
		autoplaySpeed: 5000,
		dots: false,
		arrows: true,
		easing: 'ease-in-out',
		prevArrow: '<span class="slider-navigation slider-navigation-prev"><i class="ti ti-angle-left"></i></span>',
		nextArrow: '<span class="slider-navigation slider-navigation-next"><i class="ti ti-angle-right"></i></span>',
		responsive: [{
			breakpoint: 992,
			settings: {
				slidesToShow: 3,
				slidesToScroll: 1
			}
		},
		{
			breakpoint: 768,
			settings: {
				slidesToShow: 2,
				slidesToScroll: 1
			}
		},
		{
			breakpoint: 576,
			settings: {
				slidesToShow: 1,
				slidesToScroll: 1
			}
		}]
	});



	/* Blog Slider Active */
	$('.blog-slider-active').slick({
		slidesToShow: 3,
		autoplay: true,
		autoplaySpeed: 5000,
		dots: false,
		arrows: true,
		easing: 'ease-in-out',
		prevArrow: '<span class="slider-navigation slider-navigation-prev"><i class="ti ti-angle-left"></i></span>',
		nextArrow: '<span class="slider-navigation slider-navigation-next"><i class="ti ti-angle-right"></i></span>',
		responsive: [{
			breakpoint: 992,
			settings: {
				slidesToShow: 2,
				slidesToScroll: 1
			}
		},
		{
			breakpoint: 768,
			settings: {
				slidesToShow: 1,
				slidesToScroll: 1
			}
		}]
	});



	/* Similliar Products Slider Active */
	$('.similliar-products-slider-active').slick({
		slidesToShow: 4,
		autoplay: true,
		autoplaySpeed: 5000,
		dots: false,
		arrows: true,
		easing: 'ease-in-out',
		prevArrow: '<span class="slider-navigation slider-navigation-prev"><i class="ti ti-angle-left"></i></span>',
		nextArrow: '<span class="slider-navigation slider-navigation-next"><i class="ti ti-angle-right"></i></span>',
		responsive: [{
			breakpoint: 1200,
			settings: {
				slidesToShow: 3,
				slidesToScroll: 1
			}
		},
		{
			breakpoint: 992,
			settings: {
				slidesToShow: 2,
				slidesToScroll: 1
			}
		},
		{
			breakpoint: 576,
			settings: {
				slidesToShow: 1,
				slidesToScroll: 1
			}
		}]
	});



	/* Product Details Images Slider */
	$('.product-details-images').slick({
		slidesToShow: 1,
		slidesToScroll: 1,
		autoplay: false,
		autoplaySpeed: 5000,
		dots: false,
		infinite: true,
		centerMode: true,
		centerPadding: 0,
		prevArrow: '<span class="slider-navigation slider-navigation-prev"><i class="ti ti-caret-left"></i></span>',
		nextArrow: '<span class="slider-navigation slider-navigation-next"><i class="ti ti-caret-right"></i></span>',
		asNavFor: '.product-details-thumbs'
	});
	$('.product-details-thumbs:not(.product-details-thumbs-2)').slick({
		slidesToShow: 4,
		slidesToScroll: 1,
		autoplay: false,
		autoplaySpeed: 5000,
		dots: false,
		infinite: true,
		focusOnSelect: true,
		centerMode: false,
		centerPadding: 0,
		prevArrow: '<span class="slider-navigation slider-navigation-prev"><i class="ti ti-caret-left"></i></span>',
		nextArrow: '<span class="slider-navigation slider-navigation-next"><i class="ti ti-caret-right"></i></span>',
		asNavFor: '.product-details-images'
	});
	$('.product-details-thumbs-2').slick({
		slidesToShow: 3,
		slidesToScroll: 1,
		autoplay: false,
		autoplaySpeed: 5000,
		dots: false,
		infinite: true,
		focusOnSelect: true,
		centerMode: false,
		centerPadding: 0,
		prevArrow: '<span class="slider-navigation slider-navigation-prev"><i class="ti ti-caret-left"></i></span>',
		nextArrow: '<span class="slider-navigation slider-navigation-next"><i class="ti ti-caret-right"></i></span>',
		asNavFor: '.product-details-images',
		vertical: true,
		responsive: [
		{
			breakpoint: 992,
			settings: {
				vertical: false
			}
		},
		{
			breakpoint: 768,
			settings: {
				vertical: true,
			}
		},
		{
			breakpoint: 576,
			settings: {
				vertical: false,
			}
		}
		]
	});




	/* Nice Select Activation */
	$('select').niceSelect();
	
	

	/* Bootstrap4 Tooltip Active */
	$('[data-toggle="tooltip"]').tooltip();


	

	/* Mobile Menu */
	$('nav.sf-navigation').meanmenu({
		meanMenuClose: '<img src="img/icons/icon-close.png" alt="close icon">',
		meanMenuCloseSize: '18px',
		meanScreenWidth: '991',
		meanExpandableChildren: true,
		meanMenuContainer: '.mobile-menu',
		onePage: true
	});




	/* Product Quantity */
	$('.quantity-select').append('<div class="dec qtybutton">-</i></div><div class="inc qtybutton">+</div>');
    $('.qtybutton').on('click', function () {
        var $button = $(this);
		var oldValue = $button.parent().find('input').val();
		var newVal;
        if ($button.text() == "+") {
            newVal = parseFloat(oldValue) + 1;
        } else {
            if (oldValue > 1) {
                newVal = parseFloat(oldValue) - 1;
            } else {
                newVal = 1;
            }
        }
        $button.parent().find('input').val(newVal);
	});
	



	/* Product Details Color & Size */
	$('.product-details-color ul li, .product-details-size ul li').on('click', function(){
		$(this).addClass('checked').siblings().removeClass('checked');
	});




	/* Product Popup */
	$('.product-details-images').magnificPopup({
		type:'image',
		delegate: 'a',
	});
	$('.product-details-gallery').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery:{
			enabled:true
		}
	});




	/* Quick View Modal */
	$('.quick-view-trigger').on('click', function(e){
		e.preventDefault();
		$('.quick-view-modal').toggleClass('is-visible');
		$('.quick-view-modal').find('.body-overlay').toggleClass('is-visible');
	});
	$('.close-quickview-modal').on('click', function(){
		$('.quick-view-modal').removeClass('is-visible');
	});
	$('.quick-view-modal').find('.body-overlay').on('click', function(){
		$('.quick-view-modal').removeClass('is-visible');
	});




	/* Rating Hover Action */
	$('.ratting-box.hover-action span').on('mouseenter', function(){
		$('.ratting-box.hover-action span').addClass('active');
		$(this).nextAll('span').removeClass('active');
	});




	/* Range Slider Active */
	$('.range-slider').nstSlider({
		'left_grip_selector': '.range-slider-leftgrip',
		'right_grip_selector': '.range-slider-rightgrip',
		'value_bar_selector': '.bar',
		'value_changed_callback': function(cause, leftValue, rightValue) {
			$(this).parent().find('.range-slider-leftlabel').text(leftValue);
			$(this).parent().find('.range-slider-rightlabel').text(rightValue);
		}
	});





	/* Scroll Up */
	$.scrollUp({
		scrollText: '<i class="ti ti-angle-up"></i>',
		easingType: 'linear',
		scrollSpeed: 900,
	});



	/* Progress Bar Effect */
	$(window).on('scroll', function () {

		function winScrollPosition() {
			var scrollPos = $(window).scrollTop(),
				winHeight = $(window).height();
			var scrollPosition = Math.round(scrollPos + (winHeight / 1.2));
			return scrollPosition;
		}


		var trigger = $('.progress-bar');
		if (trigger.length) {
			var triggerPos = Math.round(trigger.offset().top);
			if (triggerPos < winScrollPosition()) {
				trigger.each(function () {
					$(this).addClass('fill');
				});
			}
		}

	});



	/* Checkout Login Coupon */
	$('.checkout-info-collapsebox').css('display', 'none');
	$('.checkout-info-login-trigger, .checkout-info-coupon-trigger').on('click', function(e){
		e.preventDefault();
		$(this).parent('.checkout-info').next('.checkout-info-collapsebox').slideToggle();
	});


	
	/* Different Address Form */
	$('.different-address-form-trigger .sn-checkbox').on('change', function(){
		if( $(this).is(':checked') ){
			$('.different-address-form').slideDown();
		} else{
			$('.different-address-form').slideUp();
		}
	});




	/* Header Searchbox */
	$('.header-search-trigger').on('click', function(){
		$(this).find('.ti').toggleClass('ti-close');
		$('.header-searchbox-wrapper').slideToggle();
	});



	/* Header Minicart */
	$('.header-minicart-trigger').on('click', function(){
		$('.header-minicart').slideToggle();
	});



	/* Ajax Chimp */
	$('#mc-form').ajaxChimp({
		language: 'en',
		callback: mailChimpResponse,
		// ADD YOUR MAILCHIMP URL BELOW HERE!
		url: 'http://devitems.us11.list-manage.com/subscribe/post?u=6bbb9b6f5827bd842d9640c82&amp;id=05d85f18ef'
	
	});
	function mailChimpResponse(resp) {
		if (resp.result === 'success') {
			$('.mailchimp-success').html('' + resp.msg).fadeIn(400);
			$('.mailchimp-error').fadeOut(400);
			
		} else if(resp.result === 'error') {
			$('.mailchimp-error').html('' + resp.msg).fadeIn(400);
		}  
	}




	/* Data View Mode */
	$('.toolbox-view').on('click', 'button', function(){
		$(this).addClass('active').siblings().removeClass('active');
		var viewMode = $(this).data('product-view');

		if(viewMode == 'list'){
			$('.shop-page-products').find('.product-item').addClass('product-item-list');
			$('.shop-page-products').addClass('list').removeClass('grid');
		} else {
			$('.shop-page-products').find('.product-item').removeClass('product-item-list');
			$('.shop-page-products').addClass('grid').removeClass('list');
		}
		$.cookie('viewmode', viewMode);
	});

	if( $.cookie('viewmode') == 'list' ){
		$('.toolbox-view button[data-product-view="list"]').addClass('active').siblings().removeClass('active');
		$('.shop-page-products').addClass('list').removeClass('grid');
		$('.shop-page-products').find('.product-item').addClass('product-item-list');
	} else{
		$('.toolbox-view button[data-product-view="grid"]').addClass('active').siblings().removeClass('active');
		$('.shop-page-products').addClass('grid').removeClass('list');
		$('.shop-page-products').find('.product-item').removeClass('product-item-list');
	}



	/* Widget Category Menu */
	$('.single-widget-categories ul li a').on('click', function(e){
		$(this).toggleClass('is-visible');
		$(this).parent('li').toggleClass('active');
		if( $(this).parent('li').children('ul').length !== 0 ){
			e.preventDefault();
			$(this).parent('li').find('ul').slideToggle();
		}
	});



})(jQuery);
