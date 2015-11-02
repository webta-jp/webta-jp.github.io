//= require jquery/dist/jquery.js
//= require echojs/dist/echo.js
//= require moment/min/moment.min.js
//= require moment/locale/ja.js
//= require jquery-rss/dist/jquery.rss.min.js
//= require bootstrap-sprockets
//= require slidebars/distribution/0.10.2/slidebars.js
//= require slidebars
//= require_directory ./layouts/

$(function() {
  init_slidebars();
  initJqueryRSS();
});

initJqueryRSS = function() {
  $("#blog-rss-feeds").rss("http://www.specificfeeds.com/kntmrkm-new",
    {
      limit: 10,
      layoutTemplate: "<ul class='list-group'>{entries}</ul>",
      entryTemplate: "<li class='list-group-item'><a href='{url}'>{date} {title}</a></li>",
      dateFormat: 'YYYY/MM/DD'
    })


};