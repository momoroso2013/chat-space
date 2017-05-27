$(function() {
  function buildHTML(message) {
    var addImage = (message.image !== null) ? `<img class = "image_size", src="${message.image}">` : ''
    var html = `
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
    // 復習で残す
    // console.log("===message===");
    // console.log(message);
    // console.log("===item===");
    // for(item of formdata) console.log(item);
    // console.log("===image===");
    // console.log(formdata.get("message[image]"));
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
    });
  });
});
