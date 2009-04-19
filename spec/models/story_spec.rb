require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Story do
  before(:each) do
    @valid_attributes = {
      :text => "x"*126,
      :user_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Story.create!(@valid_attributes)
  end

  describe :text do
    describe 'passed 126 character message' do
      it 'should be valid' do
        s = Story.new(:text => 'x'*126)
        s.should have_valid_attribute(:text)
      end
    end

    describe 'passed too short a message' do
      it "should show a too short message" do
        s = Story.new
        [ '',
          "\n"*126,
          'x', 
          'x'*125,
          (' ' + 'x'*125),
          ("\n" + 'x'*125),
          ('x'*125 + ' '),
          ('x'*125 + "\n")].each do |t|
          s.text = t
          s.should have_invalid_attribute(:text, 'too short. Must be exactly 126 characters without whitespace padding')
        end
      end
    end

    describe 'passed too long a message' do
      it "should show a too long message" do
        s = Story.new
        ['x'*127].each do |t|
          s.text = t
          s.should have_invalid_attribute(:text, 'too long. Must be exactly 126 characters without whitespace padding')
        end
      end
    end

    it "should be unique" do
      s = Story.new
      s.text = 'x'*126
      s.save
      t = Story.new
      t.text = 'x'*126
      t.should have_invalid_attribute(:text, 'must be unique')
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