class Answer < ApplicationRecord
  belongs_to :question

  validates :response, presence: true, length: {minimum: 50}
  validates :question, presence: true
end
