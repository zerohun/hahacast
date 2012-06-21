
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require underscore
//= require backbone
//= require global_config
//= require hahacast
//= require cordova-1.5.0.js
//= require bootstrap
//= require_tree ../templates
//= require_tree ./models
//= require_tree ./collections
//= require_tree ./views
//= require_tree ./routers
//= require_tree ./ondevice_initializers
//= require_tree ./lib
//= require bootstrap_1

$(document).ready(function(){

  $(".menu-item").click(function(){
    $(".nav-collapse").removeClass('in');
    $(".nav-collapse").css("height","0px");
    
  })



   // Your code here
 });

