module Hangouts
  class Event
    getter :event_id, :sender_id, :timestamp
    def initialize(event_id : String, sender_id : String, timestamp : String, message : Array(String))
      @event_id = event_id
      @sender_id = sender_id
      @timestamp = timestamp
      @message = message
    end

    def message
      @message
    end

    def formatted_message
      message.reduce("") { |memo, value| memo += "#{value} "}.chomp(' ')
    end
  end
end
