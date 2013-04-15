class User < ActiveRecord::Base
  attr_accessible :email, :fname, :lname

  has_many :questions
  has_many :votes
  has_many :upvoted_questions, through: :votes
end
