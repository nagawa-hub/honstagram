$(function() {
  $('#search-field').on('keyup', function(){
    var word = $.trim($(this).val());
    $(".searching-list").empty();
    $.ajax({
      type: 'GET',
      url: '/books/search_word',
      data: { word: word },
      dataType: 'json'
    })
    .done(function(data){
      if (word.length === 0){
        $(".searching-list").empty();
        $(".searching-list").hide();
      }
      else{
        $(data).each(function(i,word){
          $('.searching-list').append(
            `<li class="item">${word.title}</li>`
          )
        })
        $(".searching-list").show();
      }
    })
    .fail(function(){
      alert("ユーザー検索に失敗しました");
    });
  });
});