/* Scripts for the universal modals */
console.log("Testing!");

//Growl functions
function showGrowl( msg, growl_class ){
//Pops up a growl of given class with the given message	
	//Set text and show
	$(".growl."+growl_class+" .growl_text").text(msg);
	$(".growl."+growl_class).show();
	
	//Set fadeout timer
	setTimeout(function(){
		$(".growl."+growl_class).fadeOut(2000, function(){
		})
	}, 3000);

}

function hideGrowl(growl_class){
	$(".growl."+growl_class).hide();
}

//<DalekVoice> ELEVATE!!! </DalekVoice>
$("#elevator").click(function(){
	$('html, body').animate({scrollTop: '0px'}, 800);
});


//Show elevator when they scroll down and hide is at top of page
$(window).scroll(function() {
    if ( $(this).scrollTop() > 100 ){
        $("#elevator").fadeIn('fast');
    } 
	else{
        $("#elevator").fadeOut('fast');
    }
});


//Image functions
function showFullSize( path ){
	//Shows the image and centers the modal
	showIndicator();
	$("#image img").attr('src', path).imagesLoaded(function(){
		hideIndicator();
		//Show the modal
		$("#image").show();
	});
}

function hideFullSize(){
	//Hides and clears the image modal
	$("#image").hide();
	$("#image img").attr('src', '');
}


//Indicator modal functions
function showIndicator(){
	$('#indicator').show();
}

function hideIndicator(){
  $('#indicator').hide();
}


//General modal script

function hideAllModals(){
/*Hides any currently open modals. Calls the hide functions for them so any
special actions in the hide functions are performed, such as clearing forms.
This requires first checking if the function is defined in such a way that it
doesn't throw an error if undefined. */

	if( isFunction( 'hideShare' ) ){
		hideShare();
	}
	if( isFunction( 'hideIndicator' ) ){
		hideIndicator();
	}
	if( isFunction( 'hideItemSuggest' ) ){
		hideItemSuggest();
	}
	if( isFunction( 'hideFeedback' ) ){
		hideFeedback();
	}
	if( isFunction( 'hideRequestInvite' ) ){
		hideRequestInvite();
	}
	if( isFunction( 'hideWantItem' ) ){
		hideWantItem();
	}
	if( isFunction( 'hideHaveItem' ) ){
		hideHaveItem();
	}
	if( isFunction('hideMessageModal') ){
		hideMessageModal();
	}
	if( isFunction('hideMakeOffer') ){
		hideMakeOffer();
	}
	if( isFunction('hideReviewOffer') ){
		hideReviewOffer();
	}
	if( isFunction('hideTransactionFeedback') ){
		hideTransactionFeedback();
	}
	if( isFunction('hideShippingModal') ){
		hideShippingModal();
	}
	if( isFunction('hideBuyModal') ){
		hideBuyModal();
	}
	if( isFunction('hideCollectionsModal') ){
		hideCollectionsModal();
	}
	if( isFunction('hideCropModal') ){
		hideCropModal();
	}
	if( isFunction('hideCreateShelf') ){
		hideCreateShelf();
	}
	if( isFunction('hideEditShelf') ){
		hideEditShelf();
	}
	if( isFunction('hideCuratorApplication') ){
		hideCuratorApplication();
	}
	if( isFunction('hideDeclineContribution') ){
		hideDeclineContribution();
	}
	if( isFunction('hidePinsModal') ){
		hidePinsModal();
	}
	
	$(".overlay").hide(); //Catch any others
	
}

$("body").click(function(e){
	if( $(e.toElement).hasClass('overlay') )
		hideAllModals();
});



//Enable binding to the show and hide events

(function ($) {
  $.each(['show', 'hide'], function (i, ev) {
    var el = $.fn[ev];
    $.fn[ev] = function () {
      this.trigger(ev);
      return el.apply(this, arguments);
    };
  });
})(jQuery);

//Bind to the show and hide events

$(function () {
  $('.overlay').on('show', function () {
    showModal( $(this) );
  });
});

$(function () {
  $('.overlay').on('hide', function () {
    hideModal();
  });
});


//Show and hide handlers

function showModal( $overlay ){
	
	$("body").css("overflow", "hidden");
	
	if (screen.width < 767) {
		//Mobile
		$("#main").css("overflow", "hidden");
		var modal_height = parseInt( $overlay.find(".modal").outerHeight() );
		$('.overlay').css('min-height', $(document).height() + (modal_height/4) + 'px');
	}
	else{
		//Desktop
		$overlay.css('position', 'fixed');
	}
	
}

function hideModal(){
	
	$("body").css("overflow", "visible");
	
	if( screen.width < 767 ){
		//Mobile
		$("#main").css('overflow', 'visible');
	}
	else{
		//Desktop
		$('.overlay').position('absolute');
	}

}