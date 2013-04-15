class Vote < ActiveRecord::Base
  attr_accessible :question_id, :user_id

  belongs_to :user
  belongs_to :upvoted_question, class_name: 'Question',
             foreign_key: :question_id, counter_cache: true
end
