//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require react
//= require react_ujs
//= require_tree .

var ready;

ready = function() {
  _toggleReports();
};

_toggleReports = function() {
  $('#report_link').click(function () {
    $('.report_list').toggle();
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);
