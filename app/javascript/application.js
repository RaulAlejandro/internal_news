// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "jquery"
import "jquery_ujs"
//import "popper"


/*$('#posts_search input').keyup(function () {
  $.get($('#posts_search').attr('action'), 
    $('#posts_search').serialize(), null, 'script');
  return false;
});*/

$('#posts_search select').change(function () {
  $.get($('#posts_search').attr('action'), 
    $('#posts_search').serialize(), null, 'script');
  return false;
});
