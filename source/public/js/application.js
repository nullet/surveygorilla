$(document).ready(function(){
  $('#add-question').on('click', function(event){
    event.preventDefault();

    var url = $(this).attr('href')

    $.get(url, function(response) {
      $('#add-question').before(response)
    })


  })
});