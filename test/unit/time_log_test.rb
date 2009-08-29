require 'test_helper'
require 'time_log'

class TimeLogTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_required
    assert_required_values TimeLog, :task_date => Date.today, :worked_hours => Time.now
  end
end
