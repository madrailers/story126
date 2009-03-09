class Story < ActiveRecord::Base
  
  # schema
  # belongs_to :user # User class is not yet implemented
  
  # validations
  validate :text_must_be_exactly_126_characters
  
protected
  # a special validation is required since we need to apply "strip"
  def text_must_be_exactly_126_characters
    unless text.strip.length == 126 then
      errors.add(:text, 'must be exactly 126 characters without whitespace padding')
    end
  end
end
