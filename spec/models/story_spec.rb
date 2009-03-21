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
    it "should be exactly 126 characters" do
      s = Story.new
      [ '',
        "\n"*126,
        'x', 
        'x'*125,
        (' ' + 'x'*125),
        ("\n" + 'x'*125),
        ('x'*125 + ' '),
        ('x'*125 + "\n"), 
        'x'*127].each do |t|
        s.text = t
        s.should have_invalid_attribute(:text,
          'must be exactly 126 characters without whitespace padding')
      end
      s.text = 'x'*126
      s.should have_valid_attribute(:text)
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
