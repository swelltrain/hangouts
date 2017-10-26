module Hangouts
  class Event
    getter :event_id, :sender_id, :timestamp
    def initialize(event_id : String, sender_id : String, timestamp : Time, message : Array(String))
      @event_id = event_id
      @sender_id = sender_id
      @timestamp = timestamp
      @message = message
    end

    def message
      @message
    end

    def formatted_message
      raw = message.reduce("") { |memo, value| memo += "#{value.downcase} "}.chomp(' ')
      raw.gsub(/\x{263a}/, "smile")
    end

    def to_s(io)
      io << formatted_message
    end
  end
end
