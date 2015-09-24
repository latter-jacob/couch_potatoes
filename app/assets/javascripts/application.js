// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .

$(function(){ $(document).foundation(); });

$("#plus_button").on("click", function() {

  // $.ajax({
  //   method: "GET",
  //   url: "/votes",
  //   dataType: "json"
  // })
  //
  // .done(function(data){
  //   debugger
  //   alert(data);
  // });

  var review_id = this.parentElement.id;

  $.ajax({
    method: "POST",
    url: ("/reviews/" + review_id + "/votes"),
    data: { review_id: review_id, vote: this.id },
    dataType: "json"
  })

  .done(function(data){
    debugger;
  });

});
