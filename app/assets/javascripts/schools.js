$(function() {
  var school = null;
  var cancelFlag = 0;
  $('#school_search').on("click",function(e) {
    e.preventDefault();
    const name = $('#name').val();
    $.ajax({
      type:"GET",
      data:{
        name: name
      }
    }).done(function(data) {
      if (data != null){
        if(cancelFlag == 0){
          cancelFlag = 1;
          school = data.school
          school.forEach(function(e){
            $('#school_lists').append(`
              <div class="col-lg-4">
                <div class="card mt-5 mb-4" style="width: 20rem;">
                  <img src="${e.image_url.school_image1}" class="card-img-top" size="300x300">
                  <div class="card-body webkit-center">
                    <h4 class="card-title">${e.name}</h4>
                    <span class="badge badge-success mr-1 mt-1 p-2">
                      ${e.code.prefname}
                    </span>
                    <p class="card-text">
                      <span class="badge badge-warning mr-1 mt-1 p-2">
                        ${e.code.category_name_l[0]}
                      </span>
                    </p>
                    <button type="button" name="button" class="btn btn-primary" id="submit">登録する</button>
                  </div>
                </div>
              </div>
            `)
          })
        }
      }
    }).fail(function() {
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
        name: school[post_index].name,
        address: school[post_index].address,
        detail: school[post_index].detail,
        res_id: school[post_index].id,
        tell: school[post_index].tel,
        latitude: school[post_index].latitude,
        longitude: school[post_index].longitude,
        image_url_a: school[post_index].image_url.school_image1,
        image_url_b: school[post_index].image_url.school_image2,
        genre: school[post_index].code.category_name_l[0],
        subgenre: school[post_index].code.category_name_l[1],
        opentime: school[post_index].opentime
      }
    }).done(function(data) {
    }).fail(function() {
      alert('エラーが発生しました。詳細はaoki.memetaaa@gmail.comへお問い合わせください。');
    });
  });
  $('#name').on("keyup",function(e) {
    $('#school_lists').empty();
    $('.result').empty();
    cancelFlag = 0;
  });
});