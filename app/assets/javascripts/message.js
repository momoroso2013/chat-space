$(function() {
  function buildHTML(message) {
    var htmlName = $('<p class="posted-user-name">').append(message.name);
    var htmlTime = $('<p class="created-at">').append(message.created_at);
    var htmlText = $('<p class="user-message">').append(message.text);
    var html = [htmlName, htmlTime, htmlText];
    return html;
  }

  $('.type-message--send').on('click', function(e) {
    e.preventDefault();
    var textField = $('.type-message');
    var message = textField.val();
    $.ajax({
      type: 'POST',
      url: './messages',
      data: {
        message: {
          text: message
        }
      },
      dataType: 'json'
    })
    .done(function(data) {
      var html = buildHTML(data);
      for(var i = 0; i < html.length; i++) {
      $('.chat__content-message').append(html);
    }
      textField.val('');

    })
    .fail(function() {
      alert("メッセージを入力してください");
    });
  });
});
