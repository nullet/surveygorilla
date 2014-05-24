class Survey < ActiveRecord::Base
  belongs_to :author, class_name: "User", foreign_key: :author_id
  has_many :questions

  def get_number_of_answers
    total = 0

    self.questions.each do |question|
      question.choices.each { |choice| total += choice.answers.length }
    end
    return total
  end
end
