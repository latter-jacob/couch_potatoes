var voteClasses = function(thing) {
  if (thing.id == "upvote") {
    $(thing).attr("id", "upvoted");
    $($(thing).siblings(".vote-down")[0]).attr("id", "downvote");
  } else if (thing.id == "upvoted") {
    $(thing).attr("id", "upvote");
    $($(thing).siblings(".vote-down")[0]).attr("id", "downvote");
  } else if (thing.id == "downvote") {
    $(thing).attr("id", "downvoted");
    $($(thing).siblings(".vote-up")[0]).attr("id", "upvote");
  } else if (thing.id == "downvoted") {
    $(thing).attr("id", "downvote");
    $($(thing).siblings(".vote-up")[0]).attr("id", "upvote");
  }
};

$(".vote").on("click", function() {
  var vote = this.id;
  var reviewId = this.parentElement.id;
  voteClasses(this);
  var $t = $(this);
  $.ajax({
    method: "POST",
    url: ("/reviews/" + reviewId + "/votes"),
    data: { review_id: reviewId, vote: vote },
    dataType: "json"
  })
  .done(function(data){
    $($t.siblings(".score")[0]).text(data.score);
  });
});
