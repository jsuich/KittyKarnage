$(document).ready(function() {
  // $("#5").hide();
    $("#5").append("<img src='P1MusketRight.png' width='150px' height='150px'/>");
    $("#9").append("<img src='P2FlamesLeft.png' width='150px' height='150px'/>");

    $('form').submit(function(event){
      event.preventDefault();

      for(var i = 0; i < 8; i++)
      { movenum = i
        player_one_move = 4
      }

    });
});
