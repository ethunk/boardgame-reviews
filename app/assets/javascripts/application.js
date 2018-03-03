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
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .

$(function(){ $(document).foundation(); });

$(document).ready(function(){
  let upArrow = $("a.upvote");
  let downArrow = $("a.downvote");
  let voteDataRequest = (voteTotal) => {
    let url = $(this)[0].activeElement.href;
    $.ajax({
    type: 'POST',
    url: url,
    dataType: 'json',
    success: function(response) {
      voteTotal.text(response)
      ;}
    });
  };

  let upVoteAction = upArrow.on('click', function(event) {
    event.preventDefault();
    let voteTotal = $(this).parent().parent().find('div.vote-total-value');
    voteDataRequest(voteTotal);
    event.stopPropagation();

  });

  let downVoteAction = downArrow.on('click', function(event) {
    event.preventDefault();
    let voteTotal = $(this).parent().parent().find('div.vote-total-value');
    voteDataRequest(voteTotal);
    event.stopPropagation();
  });

});
