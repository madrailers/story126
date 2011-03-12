class Story < ActiveRecord::Base
  validates_length_of :body, :is => 126

  state_machine :state, :initial => :submitted do

    event :approve do
      transition :submitted => :approved
    end

    event :publish do
      transition :approved => :published
    end

    event :mark_as_spam do
      transition all => :spam
    end

  end
end
