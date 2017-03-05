/*function to refresh rating*/
var refreshRating = function() {
  $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
  $('.rated').raty({ path: '/assets',
      readOnly: true,
      score: function() {
        return $(this).attr('data-score');
      }
  }); 
};

/*call to refreshRating function must be done afer making AJAX request */
$(document).on('turbolinks:load ajaxSuccess', function(){
  refreshRating();

    /*elevateZoom */
    $('.img-zoom').elevateZoom({
        zoomType: "lens",
        lensShape: "round",
        lensSize: 375,
   	}); /*ends elevateZoom*/

}); /*ends $(document)*/