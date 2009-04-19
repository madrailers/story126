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
    transitions :to => :approved, :from => [:pending, :rejected, :spam],
      :success => Proc.new {|s| s.approved_at = Time.now}
  end

  aasm_event :reject do
    transitions :to => :rejected, :from => [:pending, :approved, :spam],
      :success => Proc.new {|s| s.rejected_at = Time.now}
  end

  aasm_event :mark_as_spam do
    transitions :to => :spam, :from =>
      [:pending, :approved, :published, :rejected],
      :success => Proc.new {|s| s.marked_as_spam_at = Time.now}
  end

  aasm_event :publish do
    # tweet!
    # store link to tweet!
    transitions :to => :published, :from => [:approved],
      :success => Proc.new {|s| s.published_at = Time.now}
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
#
# Table name: stories
#
#  id                :integer(4)      not null, primary key
#  user_id           :integer(4)
#  state             :string(255)
#  text              :string(255)
#  approved_at       :time
#  created_at        :datetime
#  marked_as_spam_at :time
#  published_at      :time
#  rejected_at       :time
#  updated_at        :datetime