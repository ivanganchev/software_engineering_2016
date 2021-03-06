require 'csv'
require 'json'

file = ARGV[0]
task = ARGV[1].to_i

data = []
CSV.foreach(file) { |row| data.push(row) }
videos = Hash.new
users = Hash.new

case task
when 1
  data.each do |info|
    if videos[info[1]] == nil
      videos[info[1]] = info[2].to_f
    else
      videos[info[1]] += info[2].to_f
    end
  end
  puts JSON.generate({ :video_id => videos.key(videos.values.max), :perc => videos.values.max.round(2) })
when 2
  data.each do |info|
    if videos[info[1]] == nil
      videos[info[1]] = 1
    else
      videos[info[1]] += 1
    end
  end
  puts JSON.generate({ :video_id => videos.key(videos.values.max), :times => videos.values.max.round(2) })
when 3
  data.each do |info|
    if users[info[0]] == nil
      users[info[0]] = info[2].to_f
    else
      users[info[0]] += info[2].to_f
    end
  end
  puts JSON.generate({ :video_id => users.key(users.values.max), :perc => users.values.max.round(2) })
when 4
  data.each do |info|
    if users[info[0]] == nil
      users[info[0]] = 1
    else
      users[info[0]] += 1
    end
  end
  puts JSON.generate({ :video_id => users.key(users.values.max), :times => users.values.max.round(2) })
end
