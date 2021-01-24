$(function() {
  $('#search-field').on('keyup', function(){
    var word = $.trim($(this).val());
    $(".searching-list").hide();
    $(".searching-list").empty();
    if (word.length !== 0){
      $.ajax({
        type: 'GET',
        url: '/books/search_word',
        data: { word: word },
        dataType: 'json'
      })
      .done(function(data){
        if (data.length === 0){
          $('.searching-list').append(
            `<li class="item">一致する投稿はありません</li>`
          )
          $(".searching-list").show();
        }
        else {
          $(data).each(function(i,word){
            $('.searching-list').append(
              `<li class="item">${word.title}</li>`
            )
          })
          $(".searching-list").show();
          $(".searching-list .item").on("click",function(){
            $('#search-field').val($(this).text())
            $(".searching-list").hide();
          })
        }
      })
      .fail(function(){
        alert("ユーザー検索に失敗しました");
      });
    }
  });
});