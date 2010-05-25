$( document ).ready( function() {
  $( "div.comments a" ).click( function() {
    $(this).next().show("slow");
  });
});
