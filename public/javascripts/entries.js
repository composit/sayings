$( document ).ready( function() {
  $( "div.comments a" ).click( function() {
    $(this).next().toggle("slow");
    return false;
  });
});
