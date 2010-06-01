$( document ).ready( function() {
  $( "a.show-field" ).click( function() {
    $(this).next().toggle("slow");
    return false;
  });
  $( "a.login" ).click( function() {
    $(location).attr('href','/users/sign_in');
    return false;
  });
});
