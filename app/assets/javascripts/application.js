// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery_ujs
//= require jquery.remotipart
//= require twitter/bootstrap
//= require bootstrap-datepicker
//= require activestorage
//= require_tree .

$(document).ready(function () {
  $('body').on('click', '[data-toggle="modal"]', function(e) {
    e.preventDefault();
    $.ajax({
      url: $(this).attr('href'),
      dataType: 'HTML',
      success: function(result) {
        $('.modal-body').html(result);
        $('.datepicker').datepicker({
          format: "dd/mm/yyyy"
        });
      },
      error: function(result) {
        $('.modal-body').html('Error loading content. Please close popup and retry.');
      },
      complete: function(e) {
        $('#myModal').modal('show');
      }
    });
    }); 
});

function clearViewPane() {
  $('#errors .alert-danger').html('').addClass('hidden');
  $('#content_pane').html('');
}

function loadTask(elem) {
  $.ajax({
    url: $(elem).data('url'),
    dataType: 'HTML',
    success: function(data) {
      $('.task_pane').html(data);
    }
  })
}