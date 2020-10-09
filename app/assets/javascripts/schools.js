$(function() {
  var school = null;
  var cancelFlag = 0;
  $('#school_search').on("click",function(e) {
    e.preventDefault();
    const name = $('#name').val();
    $.ajax({
      type:'GET',
      url:'/schools/search',
      data:{ name: name },
      dataType:'json'
    })
    .done(function(data) {
      if (data != null){
        if(cancelFlag == 0){
          cancelFlag = 1;
          schools = data.school
          schools.forEach(function(e){
            $('#school_lists').append(`
              <div class="col-lg-4">
                <div class="card mt-5 shadow-sm" style="width: 20rem;">
                  <img src="${e.image_url_a}" class="card-img-top">
                  <div class="card-body webkit-center">
                    <div class="title-school-index">${e.name}</div>
                    <span class="badge badge-info mr-1 mt-1 p-2">
                      ${e.genre}
                    </span>
                      <span class="badge badge-success mr-1 mt-1 p-2">
                        ${e.subgenre}
                      </span>
                    </p>
                    <button type="button" name="button" class="btn btn-primary" id="submit">レビュー投稿</button>
                  </div>
                </div>
              </div>
            `)
          })
        }
      }
    })
    .fail(function() {
      if(cancelFlag == 0){
        cancelFlag = 1;
        $('.result').append(`
          <div id="error_explanation" class="alert alert-danger">
            <ul>
              <li>検索結果は0件でした</li>
            </ul>
          </div>
          `);
      }
    });
  });

  $(document).on("click", "#submit", function(e) {
    var elm = $(this);
    var post_index = $(".btn-primary").index(elm)-1;
    console.log(post_index);
    $.ajax({
      type: "POST",
      url:  "/schools",
      data:{
        image_url_a: school[post_index].image_url.school_image1,
        name: school[post_index].name,
        genre: school[post_index].genre,
        subgenre: school[post_index].subgenre,
      }
    }).done(function(data) {
    }).fail(function() {
      alert('エラーが発生しました。詳細はaoki.memetaaa@gmail.comへお問い合わせください。');
    });
  });
  $('#name').on("keyup",function(e) {
    cancelFlag = 0;
  });
});