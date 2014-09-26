$(function() {

  var $newRaceButton = $('#newRaceButton');
  var $newHeightButton = $('#newHeightButton');
  var $newHeightForm = $('#newHeightForm');
  var $numberInput = $('input[type="number"]');
  var $raceBox = $('#raceBox');

  newHeight = 100; //globally defined
  thumperWins = 0;
  gibsonWins = 0;

  //set up initial display
  $('span#heightLabel').text(newHeight + ' meters.'); //display initial height
  $('span#thumperWins').text(thumperWins); //display initial wins
  $('span#gibsonWins').text(gibsonWins); //display initial wins

  $newHeightButton.show();
  $newRaceButton.show();
  $newHeightForm.hide();
  $raceBox.hide();


  $('#showForm').on('click', function() {
    $newHeightButton.hide();
    $newHeightForm.show();
  });

  $newHeightForm.on('submit', function(e) {
    e.preventDefault();
    newHeight = $('input[type="number"]').val(); //change height
    $('span#heightLabel').text(newHeight + ' meters.');
    $newHeightForm.hide();
    $newHeightButton.show();
    $numberInput.val('');
  });


  $('#startRace').on('click', function() {
    $('#raceReport').text(''); // clear race results text if a race has already been run

    $('#summaryTable').html('<table id = "summaryTable"><tr><th><u>Seconds</u></th><th><u>Thumper\'s height</u></th><th><u>Gibson\'s height</u></th></tr></table>'); // clear race results text if a race has already been run
    function Racer(name, minDrag, maxDrag) {
      this.name = name;
      this.minDrag = minDrag; //min drag coeff btw 0 and 1, lower drops faster
      this.maxDrag = maxDrag; //max drag coeff btw 0 and 1, lower drops faster
      this.drag = maxDrag; //set initial drag to max
      this.acceleration = 9.81; // m per s squared
      this.currentTime = 0; // sec
      this.altitude = newHeight;
      this.distance = 0;

      this.isAero = function() {
        if (this.drag > Math.random()) {
          this.drag = this.maxDrag;
        } else {
          this.drag = this.minDrag;
        }
      };


      this.drop = function() {
        this.distance = Math.round((this.acceleration * (1 - this.drag)) * (this.currentTime + 1));
        this.currentTime++;
          return this.altitude -= this.distance;
      };

      this.summary = function() {
        if (this.drag === this.maxDrag) {
          return this.altitude + " m";
        } else {
          return this.altitude + " m (great form!)";
        }
      };
    }

    var rabbit = new Racer("Thumper", 0.1, 0.9); //sets drag min and max
    var turtle = new Racer("Gibson", 0.1, 0.9); //sets drag min and max

    $raceBox.show();

    for (timer = 0; timer < 9999; timer++) {
      if (rabbit.altitude > 0 && turtle.altitude > 0) {
        $('#summaryTable').append('<tr><td>' + rabbit.currentTime + '</td><td>' + rabbit.summary() + '</td><td>' + turtle.summary() + '</td></tr>').hide().fadeIn(200);
        rabbit.isAero();
        turtle.isAero();
        rabbit.drop();
        turtle.drop();
        continue;
      } else {
        break;
      }
    }


    // determine winner
    if (rabbit.altitude > turtle.altitude) {
      $('#raceReport').append('Splat! ' + turtle.name + '\"wins\" in ' + turtle.currentTime + ' sec, splintering shell in all directions.').hide().fadeIn(200);
      thumperWins++;
      $('span#thumperWins').text(thumperWins); //display initial wins


    } else {
      $('#raceReport').append('Splat! ' + rabbit.name + ' \"wins\" in ' + rabbit.currentTime + ' sec, bouncing wildly off the tarmac.').hide().fadeIn(200);
      gibsonWins++;
      $('span#gibsonWins').text(gibsonWins); //display initial wins
    }
  });

});