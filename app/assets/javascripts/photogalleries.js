// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//= require swipebox

$(document).ready(function(){
    $(".gallery a").each(function(){
        var t = $(this);
        t.attr("href", t.data("imgurl"));
    }).swipebox();
});