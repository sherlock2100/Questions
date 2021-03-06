class User < ActiveRecord::Base
  attr_accessible :email, :fname, :lname

  has_many :questions
  has_many :votes
  has_many :upvoted_questions, through: :votes

  validates :email, :fname, :lname, presence: true

  def to_s
    name
  end

  def name
    "#{fname} #{lname}"
  end
end
