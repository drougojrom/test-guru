document.addEventListener('turbolinks:load', function() {
  var countdownLabel = document.querySelector('.countdownLabel')
  if (countdownLabel) {
    var seconds = countdownLabel.dataset.seconds;
    if (seconds) {
      createTimer();
    } else {
      return
    }
  }

  function createTimer() {
    if (seconds < 1) {
      countdownLabel.textContent = "Time is out";
      return;
    }
    seconds--;
    countdownLabel.textContent = secondsToTime(seconds)    
    if (seconds == 0) {
      alert("Time is out! You'll be redirected to tests");
      window.location.href = '/tests';
    }
    setTimeout(createTimer, 1000)
  }

  function secondsToTime(seconds) {
    var numminutes = Math.floor((((seconds % 31536000) % 86400) % 3600) / 60);
    var numseconds = (((seconds % 31536000) % 86400) % 3600) % 60;
    return "You have left: " + numminutes + " minutes, " + numseconds + " seconds";
  }
});
