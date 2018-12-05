document.addEventListener('turbolinks:load', function() {
  var progressBar = document.querySelector('.progress')

  if (progressBar) {
    var currentNumber = progressBar.dataset.currentnumber - 1
    var total = progressBar.dataset.total
    var percent = (currentNumber * 100) / total

    progressBar.style.width = percent + "%";
  }
})


