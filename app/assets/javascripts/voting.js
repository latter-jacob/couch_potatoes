// review instance on load
// make ajax call to get the results of the method we just wrote
// give us access to that hash
// then we can call function update state

// var upvoteButton = $($('.vote-up')[0]);
// var downvoteButton = $($('.vote-down')[0]);

// var update_state = function(state) {
//   upvoteButton.attr("id", state["up"]);
//   downvoteButton.attr("id", state["down"]);
// };

var vote_classes = function(thing) {
  if (thing.id == "upvote") {
    $(thing).attr("id", "upvoted");
    $(thing.nextElementSibling).attr("id", "downvote");
  } else if (thing.id == "upvoted") {
    $(thing).attr("id", "upvote");
    $(thing.nextElementSibling).attr("id", "downvote");
  } else if (thing.id == "downvote") {
    $(thing).attr("id", "downvoted");
    $(thing.previousElementSibling).attr("id", "upvote");
  } else if (thing.id == "downvoted") {
    $(thing).attr("id", "downvote");
    $(thing.previousElementSibling).attr("id", "upvote");
  }
}


$(".vote").on("click", function() {
  var vote = this.id
  var review_id = this.parentElement.id;
  vote_classes(this);
  var $t = $(this);
  $.ajax({
    method: "POST",
    url: ("/reviews/" + review_id + "/votes"),
    data: { review_id: review_id, vote: vote },
    dataType: "json"
  })
  .done(function(data){
    $($t.siblings('.score')[0]).text(data.score);
  });
});
