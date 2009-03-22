class Story < ActiveRecord::Base

  # schema
  # belongs_to :user # User class is not yet implemented
  
  # validations
  validate :text_must_be_exactly_126_characters
  validates_uniqueness_of :text, :message => 'must be unique'

  # state machine
  include AASM
  aasm_column :state

  aasm_initial_state :pending
  aasm_state :pending
  aasm_state :approved
  aasm_state :published
  aasm_state :rejected
  aasm_state :spam

  aasm_event :approve do
    transitions :to => :approved, :from => [:pending, :rejected, :spam]
  end

  aasm_event :reject do
    transitions :to => :rejected, :from => [:pending, :approved, :spam]
  end

  aasm_event :flag_as_spam do
    transitions :to => :spam, :from =>
      [:pending, :approved, :published, :rejected]
  end

  aasm_event :publish do
    # tweet!
    # store link to tweet!
    transitions :to => :published, :from => [:approved]
  end

  aasm_event :reset do
    transitions :to => :pending, :from =>
      [:approved, :published, :rejected, :spam]
  end

protected
  # a special validation is required since we need to apply "strip"
  def text_must_be_exactly_126_characters
    length = text.strip.length
    if length < 126
      errors.add(:text, 'too short. Must be exactly 126 characters without whitespace padding')
    elsif length > 126
      errors.add(:text, 'too long. Must be exactly 126 characters without whitespace padding')
    end
  end
end


# == Schema Info
# Schema version: 20090321191310
#
# Table name: stories
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  state      :string(255)
#  text       :string(255)
#  created_at :datetime
#  updated_at :datetime