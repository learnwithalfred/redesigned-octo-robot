require "test_helper"

class SubjectTest < ActiveSupport::TestCase
  def setup
    @subject = Subject.create(name:"first subject")
  end

  def test_subject_should_have_name
    assert_equal "first subject", @subject.name
  end

end
