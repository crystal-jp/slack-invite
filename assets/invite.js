$(function() {
  'use strict';

  function setMessage(message) {
    $(".help-block .default").hide();
    $(".help-block .message").text(message).show();
  }

  $('form').on('submit', function (e) {
    e.stopPropagation();
    e.preventDefault();

    setMessage("送信中...");
    $('#email').prop('disabled', true);

    $.ajax('/invite', {
      method: 'POST',
      data: { email: $('#email').val() },
      dataType: 'json'
    })

    .done(function (data) {
      if (data && data.ok) {
        setMessage('招待に成功しました。');
        $('#email').val('');
      }

      else {
        setMessage('招待に失敗しました (' + data.error + ')。');
      }
    })

    .fail(function () {
      setMessage("招待に失敗しました。");
    })

    .always(function () {
      $('#email').prop('disabled', false);
    });
  });
});
