class Activity
  attr_reader :activity_name, :person, :amount, :total_cost, :total_participants

  def initialize(activity_name, participants_hash)
    @activity_name = activity_name
    @person = participants_hash[:person]
    @amount = participants_hash[:amount]
    @total_cost = []
    @total_participants = []
  end

  def total_cost
    @total_cost.push(@amount.to_f)
    @total_cost.inject(0){|sum, a| sum + a }
  end

  def total_cost_with_formatting
    "$#{total_cost}"
  end


  def total_participants
    (@total_participants.push(@person)).length
  end


  def split_cost
    "#{(total_cost)/(total_participants)}"
  end

end
