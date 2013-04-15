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

    that.render = function() {
      var source = $("#question-tpl").html();
      var template = Handlebars.compile(source);

      return template({body: that.body, author: that.author});
    };
  }

  function AllView(el) {
    var that = this;

    that.questions = [];

    that.render = function() {
      for (var i=0; i<that.questions.length; i++) {
        var question = that.questions[i].render();

        $(el).append(question);
      }
    };

    that.fetch = function() {
      $.getJSON('/questions.json', function(data) {
        for (var i=0; i<data.length; i++) {
          that.addQuestion(data[i]);
        }

        that.render();
      });
    };

    that.addQuestion = function(data) {
      var question = new Question(data);

      that.questions.push(question);
    };

    // that.installListeners = function() {
    //   $(".new-question").click(function() {
    //     $.post('/questions', $("#new-question").serialize()).done(function(data) {
    //       that.addQuestion(data);
    //       that.render();
    //     });
    //   });
    // };
  }

  return {
    Question: Question,
    AllView: AllView
  };
})();

new Questions.AllView('.questions').fetch();

$(document).foundation();