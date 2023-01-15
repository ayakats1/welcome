/*global $*/

// ルートパスを取得して、一致するかどうか
if (location.pathname == '/shop/posts/new') {
  document.addEventListener('turbolinks:load', () => {
    // 初期表時の動作
    // IDがpost_address_select_1のものを取得して、attr属性を確認 ここ正常に動いていないです。
    if ($("#post_address_select_1").attr('checked') == 'checked') {
      // IDがpost_postal_codeの属性disabledをfalseに変更　 入力無効を無効
      $('#post_postal_code').prop("disabled", false)
      $('#post_address').prop("disabled", false)
    } else {
      $('#post_postal_code').val("")
      // 入力無効を無効
      $('#post_postal_code').prop("disabled", true)
      $('#post_address').val("")
      // 入力無効を無効
      $('#post_address').prop("disabled", true)
    }

    // ラヂオボタン変更時の動作
    $(".address__redio-button").on('change', (e) => {
      // 変更後のラジオボタンを、value値をとる
      const redioValue = $(e.target).val()
      // 取得したvalue値を判定して、属性disabledの真偽を変更
      if (redioValue == 1) {
        $('#post_postal_code').prop("disabled", false)
        $('#post_address').prop("disabled", false)
      } else {
        $('#post_postal_code').prop("disabled", true)
        $('#post_address').prop("disabled", true)
      }
    })
  })
}
