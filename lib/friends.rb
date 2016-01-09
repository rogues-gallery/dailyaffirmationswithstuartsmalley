require "opal"
require "nodejs"

require "friends/introvert"
require "friends/version"

module Friends
end

# Put code here:
introvert = Friends::Introvert.new
puts "Initially, #{introvert.total_activities} activities across "\
     "#{introvert.elapsed_days} days for "\
     "#{introvert.total_friends} friends."
puts "Adding friend: #{introvert.add_friend(name: "Buzz Aldrin").to_s}"
puts "Adding nickname: #{introvert.add_nickname(name: "Buzz", nickname: "Moonman").to_s}"
puts "Adding: #{introvert.add_activity(serialization: "Walked on the moon with Moonman today.").display_text}"
puts "Now, #{introvert.total_activities} activities across "\
     "#{introvert.elapsed_days} days for "\
     "#{introvert.total_friends} friends."
introvert.clean
puts "Wrote out to file."
