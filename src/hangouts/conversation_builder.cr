module Hangouts
  class ConversationBuilder
    private getter :data
    def initialize(data : JSON::Any)
      @data = data
      @participants = Array(Participant).new
      @events = Array(Hangouts::Event).new
    end

    def call
      conversation_id = data["conversation_id"]["id"].as_s
      timestamp = data["conversation_state"]["conversation"]["self_conversation_state"]["invite_timestamp"].as_s
      Conversation.new(conversation_id, timestamp, participants, events)
    end

    private def participants
      return @participants if @participants.any?
      data["conversation_state"]["conversation"]["participant_data"].each do |participant_data|
          begin
            gaia_id = participant_data["id"]["gaia_id"].as_s
            chat_id = participant_data["id"]["chat_id"].as_s
            name = participant_data["fallback_name"].as_s
            @participants << Participant.new(gaia_id, chat_id, name)
          rescue KeyError
          end
      end
      @participants
    end

    private def events
      return @events if @events.any?
      text = "TEXT" #moving it outside the loop so it is not re-created each time
      data["conversation_state"]["event"].each do |event_data|
        event_id = event_data["event_id"].as_s
        sender_id = event_data["sender_id"]["gaia_id"].as_s
        timestamp = Time.epoch(event_data["timestamp"].as_s[0..9].to_i)
        messages = Array(String).new
        begin
          event_data["chat_message"]["message_content"]["segment"].each do |s|
            messages << s["text"].as_s if s["type"] == text
          end
        rescue KeyError
          # noop
        end
        @events << Hangouts::Event.new(event_id, sender_id, timestamp, messages)
      end
      @events
    end
  end
end
