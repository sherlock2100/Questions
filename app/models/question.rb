class Question < ActiveRecord::Base
  attr_accessible :body

  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many :votes

  validates :body, :user_id, presence: true

  def vote_count
    votes_count
  end
end
