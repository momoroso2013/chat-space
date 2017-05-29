$(function() {
  function buildHTML(message) {
    var addImage = (message.image !== null) ? `<img class = "image_size", src="${message.image}">` : ''
    var html = `
    <div class="chat-message" data-message-id="${message.id}">
      <p class = "posted-user-name">
        ${message.name}
      </p>
        <p class = "created-at">
      ${message.created_at}
        </p>
      <p class = "user-message">
        ${message.text}
      </p>
      <p class = "user-image">
        ${addImage}
      </p>`
      return html
  }
  $('.type-message--send').on('click', function(e) {
    e.preventDefault();
    var textField = $('.type-message');
    var message = textField.val();
    var formdata = new FormData($("#form_id").get(0));
      $.ajax({
        type: 'POST',
        url: './messages',
        data: formdata,
        processData: false,
        contentType: false,
        dataType: 'json'
      })
      .done(function(data) {
        var html = buildHTML(data);
        $(".chat__content-message").append(html);
        textField.val('');
      })
      .fail(function() {
        alert("メッセージを入力してください");
      })
  });

  setInterval(function() {
    $.ajax({
      type: 'get',
      url: './messages',
      dataType: 'json'
    })

    .done(function(data) {
      var id = $(".chat-message:last").attr("data-message-id")
      console.log("===id===")
      console.log(id)
      var html = "";
      data.messages.forEach(function(message) {
        if (message.id > id ) {
          console.log("==message.id==")
          console.log(message.id)
          html = buildHTML(message);
        }
      });
      $(".chat__content-message").append(html);
    });
  }, 5000 );
});
