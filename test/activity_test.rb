require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'
require './lib/participant'

class ActivityTest < Minitest::Test

  def test_it_exists
    activity = Activity.new("shopping",  {person: "Amy", amount: "$25.00"})
    assert_instance_of Activity, activity
  end

  def test_it_has_an_activity_name
    activity = Activity.new("shopping",  {person: "Amy", amount: "$25.00"})
    assert_equal "shopping", activity.activity_name
  end

  def test_it_has_a_participant
    activity = Activity.new("shopping",  {person: "Amy", amount: "$25.00"})

    assert_equal "Amy", activity.person
  end

  def it_gets_total_cost_of_activity
    activity = Activity.new("shopping",  [{person: "Amy", amount: "$25.00"}, {person: "Andrew", amount: "$15.00"}])

    assert_equal 35.00, activity.total_cost
  end

  def it_gets_total_cost_of_activity_with_formatting
    activity = Activity.new("shopping",  [{person: "Amy", amount: "$25.00"}, {person: "Andrew", amount: "$15.00"}])

    assert_equal "$35.00", activity.total_cost_with_formatting
  end

  def test_it_splits_costs
    activity = Activity.new("shopping",  [{person: "Amy", amount: "$25.00"}, {person: "Andrew", amount: "$15.00"}])

    assert_equal "$17.50", activity.split_cost
  end

  def test_find_what_each_person_owes
    activity = Activity.new("shopping",  [{person: "Amy", amount: "$25.00"}, {person: "Andrew", amount: "$15.00"}])

    assert_equal "$17.50", activity[:person]
  end

end
