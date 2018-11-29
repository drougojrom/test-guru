document.addEventListener('turbolinks:load', function() {
  var passwordInput = document.querySelector('.password')
  var confirmPasswordInput = document.querySelector('.password_confirmation')
  if (passwordInput && confirmPasswordInput) {
    passwordInput.addEventListener('input', check)
    confirmPasswordInput.addEventListener('input', check)
  }
})

function check() {
  var password = document.getElementById('user_password')
  var passwordConfirmation = document.getElementById('user_password_confirmation')

  if (passwordConfirmation.value.length == 0) {
    password.classList.remove('border-error')
    password.classList.remove('border-success')
    passwordConfirmation.classList.remove('border-error')
    passwordConfirmation.classList.remove('border-success')
    return
  }

  if (password.value == passwordConfirmation.value) {
    password.classList.remove('border-error')
    passwordConfirmation.classList.remove('border-failure')
    password.classList.add('border-success')
    passwordConfirmation.classList.add('border-success')
  } else {
    password.classList.remove('border-success')
    passwordConfirmation.classList.remove('border-success')
    password.classList.add('border-error')
    passwordConfirmation.classList.add('border-error')
  }
}
