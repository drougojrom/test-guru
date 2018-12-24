document.addEventListener('turbolinks:load', function() {
  var countdownLabel = document.querySelector('.countdownLabel')
  if (countdownLabel) {
    var current = countdownLabel.dataset.current
    $('.countdownLabel').countdown({until: current})
  }
};
