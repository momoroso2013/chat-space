$(function() {
  var userList = $("#user-search-result");
  var memberList =$("#chat-group-users");
  function appendList(user){
    var list =
      ` <div class="chat-group-user clearfix">
        <p class="chat-group-user__name">
          ${user.name}</p>
        <a class="chat-group-user chat-group-user__btn chat-group-user__btn--add" user_name="${user.name}" user_id="${user.id}" >追加
        </a>
        </div>`
    userList.append(list)
  }

  function buildHTML(user_name, user_id) {
    var html =
    `<div class = "chat-group-user clearfix" user_id = ${user_id}>
      <input user_name = "chat-group[user_ids][]" type = "hidden" value = "${user_id}">
      <p class = "chat-group-user__name">${user_name}</p>
      <a class = "user-search-remove chat-group-user__btn chat-group-user__btn--remove" user-id = "${user_id}">削除</a>
    </div>`
    return html
  }

  $("#user-search-field").on("keyup", function(e) {
    e.preventDefault();
    var input = $("#user-search-field").val();
    $.ajax({
      type: 'GET',
      url: '/users/search',
      data: {
        user: {
          name: input
        }
      },
      dataType: 'json'
    })
    .done(function(data){
      // 復習のために残す
      // console.log("====data====");
      // console.log(data);
      $(userList).find(".chat-group-user").remove();
      $.each(data, function(i, users) {
        $.each(users, function(i, user) {
          appendList(user);
        });
      });
    });
  });
  $(userList).on("click", ".chat-group-user__btn--add", function() {
    var userAdd = $(this);
    // 復習のためにのこす
    // console.log("==== $(this) ====");
    // console.log($(this));
    // console.log("==== $(this).attr('user_name') ====");
    // console.log($(this).attr('user_name'));
    // console.log("==== $(this).attr('user_id') ====");
    // console.log($(this).attr('user_id'));
    var user_name = $(this).attr('user_name')
    var user_id = $(this).attr('user_id')
    var html = buildHTML(user_name, user_id);
    memberList.append(html);
    userAdd.parent().remove();
  })

  $(memberList).on('click', '.chat-group-user__btn--remove', function() {
    $(this).parent().remove();
    })
});



