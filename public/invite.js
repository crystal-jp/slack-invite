$(function() {
  'use strict';

  function setMessage(klass, opt) {
    $(".help-block > span").hide();
    $(".help-block ." + klass).show();
    $(".help-block ." + klass + " .opt").text(opt || '');
    console.log(opt);
  }

  $('form').on('submit', function (e) {
    e.stopPropagation();
    e.preventDefault();

    setMessage('progress');
    $('#email').prop('disabled', true);

    $.ajax('/invite', {
      method: 'POST',
      data: { email: $('#email').val(), team: $('#team').val() },
      dataType: 'json'
    })

    .done(function (data) {
      if (data && data.ok) {
        setMessage('succeeded');
        $('#email').val('');
      }

      else {
        setMessage('failed', '(' + data.error + ')');
      }
    })

    .fail(function () {
      setMessage('failed');
    })

    .always(function () {
      $('#email').prop('disabled', false);
    });
  });
});
