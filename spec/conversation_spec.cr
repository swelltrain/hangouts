require "./spec_helper"
include Hangouts

describe Conversation do
  it "initializes" do
    participants = [Participant.new("gaia", "id", "spec", "phone")]
    events = [Hangouts::Event.new("event_id", "sender_id", Time.now, %w(one two three))]
    Conversation.new("conversation_id", "datetime", participants, events).events.should eq(events)
  end

  describe "#includes_participant?" do
    it "knows when the conversation has the participant" do
      participants = [Participant.new("gaia", "id", "spec", "phone")]
      events = [Hangouts::Event.new("event_id", "sender_id", Time.now, %w(one two three))]
      Participant.new("gaia", "id", "spec", "phone")
      c = Conversation.new("conversation_id", "timestamp", participants, events)
      c.has_participant?(Participant.new("gaia", "id", "spec", "phone")).should eq(true)
      c.has_participant?(Participant.new("gaia", "id", "spec NEW", "phone")).should eq(false)
    end
  end
end
