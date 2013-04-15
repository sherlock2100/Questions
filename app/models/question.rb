class Question < ActiveRecord::Base
  attr_accessible :body

  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many :votes

  def vote_count
    votes_count
  end
end
