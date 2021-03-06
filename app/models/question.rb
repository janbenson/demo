class Question < ActiveRecord::Base
	attr_accessible :category_id, :question, :question_id, :answers_attributes
  belongs_to :categories
  has_many :answers
  accepts_nested_attributes_for :answers
end
