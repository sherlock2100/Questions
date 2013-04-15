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
  function QuestionView(questionBody, author) {
    var that = this;

    that.render = function() {
      var source = $("#question-tpl").html();
      var template = Handlebars.compile(source);

      return template({body: questionBody, author: author});
    };
  }

  function AllView(el) {
    var that = this;

    that.questions = [];

    that.renderAll = function() {
      for (var i=0; i<that.questions.length; i++) {
        $(el).append(that.questions[i].render());
      }
    };
  }

  return {
    QuestionView: QuestionView,
    AllView: AllView
  };
})();

$(document).foundation();