require 'date'

class Scheduler
  SESSION_LENGTHS = [180, 240]

  def schedule(talks)
    tracks = []
    scheduled_talks = []
    until talks.empty?
      track = Track.new
      SESSION_LENGTHS.each do |length|
        scheduled_talks = []
        until scheduled_talks.map(&:length).inject(:+).to_i == length
          if talks.map(&:length).inject(:+) <= length
            scheduled_talks += talks
            talks.clear
            break
          end
          talks += scheduled_talks
          scheduled_talks.clear
          talks, scheduled_talks = schedule_talks(talks, length)
        end
        length == 180 ? (track.morning_session = scheduled_talks) : (track.afternoon_session = scheduled_talks)
      end
      tracks << track
    end
    tracks
  end

  def schedule_talks(talks, length)
    scheduled_talks = [] 
    talks.each do |talk|
      if(scheduled_talks.map(&:length).inject(:+).to_i + talk.length) <= length
        scheduled_talks << talks.delete(talk)
        last_added = talk
        break if scheduled_talks.map(&:length).inject(:+).to_i == length
      end
    end
    [talks, scheduled_talks]
  end

end

class Talk
  attr_reader :description
  attr_reader :length

  LIGHTNING_LENGTH = 5

  def initialize(talk)
    words = talk.split
    if words.last == 'lightning'
      @length = LIGHTNING_LENGTH
    elsif /(\d+)min/.match(words.last)
      @length = words.last.gsub('min', '').to_i
    else
      fail 'incorrect format'
    end
    @description = talk
  end
end

class Track
  attr_accessor :morning_session
  attr_accessor :afternoon_session

  def initialize
    @morning_session = []
    @afternoon_session = []
  end
end



list = []
IO.readlines("demo.txt").each{|line| list << Talk.new(line.gsub(/\n/, ''))}

scheduler = Scheduler.new
tracks = scheduler.schedule(list)
tracks.each_with_index do |track, res_index|
  puts "Track #{res_index+1}"
  time = DateTime.new(2016, 11, 16, 9, 0, 0, -1)
  track.morning_session.each do |talk|
    puts "#{time.strftime('%I:%M %p')} #{talk.description}"
    time += Rational(talk.length, 1440)
  end
  puts "12:00 PM Lunch"
  time = DateTime.new(2016, 11, 16, 13, 0, 0, -1)
  track.afternoon_session.each do |talk|
    puts "#{time.strftime('%I:%M %p')} #{talk.description}"
    time += Rational(talk.length, 1440)
  end
  puts "05:00 PM Networking Event"
  puts "-----------------------------------------------------"
end
