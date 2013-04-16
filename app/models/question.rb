class Question < ActiveRecord::Base
  attr_accessible :body

  belongs_to :author, class_name: 'User', foreign_key: :user_id
  has_many :votes

  validates :body, :user_id, presence: true

  default_scope order('votes_count DESC')

  def self.todays_questions
    Question.all.map { |question| question.formatted_json }
    # Question.where('created_at > ')
  end

  def vote_count
    votes_count
  end

  def formatted_json
    { body: body, author: author.name, votes: votes.count, id: id }
  end
end
