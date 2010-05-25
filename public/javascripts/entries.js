$( document ).ready( function() {
  $( "a.comment" ).click( function() {
    $(this).next().toggle("slow");
    return false;
  });
  $( "a.login" ).click( function() {
    $(location).attr('href','/users/sign_in');
    return false;
  });
});
