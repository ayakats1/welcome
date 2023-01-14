/*global $*/
document.addEventListener('turbolinks:load', () => {
  if ($("#post_address_select_1").attr('checked') == 'checked') {
    $('#post_postal_code').prop("disabled", false)
    $('#post_address').prop("disabled", false)
  } else {
    $('#post_postal_code').val("")
    $('#post_postal_code').prop("disabled", true)
    $('#post_address').val("")
    $('#post_address').prop("disabled", true)
  }
  $(".address__redio-button").on('change', (e) => {
    const redioValue = $(e.target).val()
    if (redioValue == 1) {
      $('#post_postal_code').prop("disabled", false)
      $('#post_address').prop("disabled", false)
    } else {
      $('#post_postal_code').prop("disabled", true)
      $('#post_address').prop("disabled", true)
    }
  })
})