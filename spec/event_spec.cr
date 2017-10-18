require "./spec_helper"
describe Hangouts::Event do
  context "getters" do
    describe "#message" do
      it "gets an event_id" do
        Hangouts::Event.new("event_id", "sender_id", "timestamp", %w(one two three)).event_id.should eq("event_id")
      end

      it "gets an sender_id" do
        Hangouts::Event.new("sender_id", "sender_id", "timestamp", %w(one two three)).sender_id.should eq("sender_id")
      end

      it "gets an timestamp" do
        Hangouts::Event.new("timestamp", "sender_id", "timestamp", %w(one two three)).timestamp.should eq("timestamp")
      end

      it "gets an array of message" do
        Hangouts::Event.new("event_id", "sender_id", "timestamp", %w(one two three)).message[0].should eq("one")
      end
    end
  end
end