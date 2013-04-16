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
//= require foundation
//= require select2
//= require_tree .
var Questions = (function() {
  function Question(question) {
    var that = this;

    that.body = question.body;
    that.author = question.author;
    that.votes = question.votes;
    that.id = question.id;

    that.render = function() {
      that.upVote();

      var source = $("#question-tpl").html();
      var template = Handlebars.compile(source);
      var html = template({
        body: that.body,
        author: that.author,
        votes: that.votes
      });

      return template({
        body: that.body,
        author: that.author,
        votes: that.votes,
        id: that.id
      });
    };

    that.upVote = function() {
      $(".vote").click(function() {
        var q_id = $(this).attr("data-question-id");

        $.post('./votes', {question_id: q_id}, function(data) {
          that.votes = data.votes;
          $(this).closest(".vote-count").html(that.votes);
        });
      });
    };
  }

  function AllView(el) {
    var that = this;

    that.questions = [];

    that.fetch = function() {
      $.getJSON('/questions.json', function(data) {
        for (var i=0; i<data.length; i++) {
          that.addQuestion(data[i]);
        }
      });
    };

    that.addQuestion = function(data) {
      var question = new Question(data);

      that.questions.push(question);
      $(el).append(question.render());
    };

    that.postListener = function() {
      $("#new_question").bind('ajax:success', function() {
        $(el).empty();
        that.fetch();
      });
    };

    that.initialize = (function() {
      that.postListener();
      that.fetch();
    })();
  }

  return {
    Question: Question,
    AllView: AllView
  };
})();

new Questions.AllView('.questions');

$(document).foundation();