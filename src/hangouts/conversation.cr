module Hangouts
  class Conversation
    getter :events, :participants

    def initialize(conversation_id : String, timestamp : String, participants : Array(Participant), events : Array(Hangouts::Event))
      @conversation_id = conversation_id
      @timestamp = timestamp
      @participants = participants
      @events = events
    end

    def has_participant?(other : Participant)
      participants.each { |participant| return true if participant == other }
      false
    end

    def sorted_events
      events.sort_by { |e| e.timestamp }
    end
  end
end
