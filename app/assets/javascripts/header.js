//Header bar functions
	
$(document).ready(function(){
  
  //Hamburger menu
  $("#hamburger_menu_button").click(function(){
    $("#hamburger_menu_container").toggle();
    return false;
  });
  
  $("body:not(#hamburger_menu_button, #hamburger_menu_container)").click(function(){
    $('#hamburger_menu_container').hide();
  });
  
  //Search
  $("#search_form").submit(function(){
    //Get the value from the bar
    var term = $("#search").val();
    
    var nonce = getNonce();	
    if( !isBlank( term ) ){
      //Send to the back end
      $.ajax({
        type: "POST",
        async: false,
        url: '/search/record',
        data: { 'term':term, 'nonce':nonce },
        dataType: "json",
        success: function( response, status, xhr ){
          //Don't care, go on to search page
          //Go on to search page, items by default
          term = encodeURIComponent( term );
          term = term.replace( /%20/g, '+' );
          goTo( '/search/items/'+term );
          console.log( response );
        },
        error: function( xhr, status, error ){
          //Don't care, go on to search page
          //Go on to search page, items by default
          term = encodeURIComponent( term );
          //goTo( '/search/items/'+term );
          console.log(xhr);
        }
      });
      
      
      
    }
    
    return false; //Prevent refresh
    
  });
  
  //Logged out buttons
  $("button#login").click(function(){
    goTo('/login');
  });
  
  $("button#join").click(function(){
    showRequestInvite();
  });
  
  //Activity button
  $("#activity_menu_button").click(function(){
    goTo('/activity');
  });
  
  //User menu
  $("#user_menu_button").click(function(){
    $("#user_menu_container").toggle();
    return false;
  });
  
  $("body:not(#user_menu_container, #user_menu_button)").click(function(){
    $('#user_menu_container').hide();
  });
    
});