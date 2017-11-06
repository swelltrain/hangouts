require "./hangouts/*"

module Hangouts
  conversations = Reader.new("/Users/stephen/crystal/hangouts/data/hangouts.json").call
  counter = 0
  melanie = Participant.new("103495081214667156826", "id", "Melanie Barnett", "phone")
  conversations.each do |conversation|
    if conversation.has_participant?(melanie)
      conversation.sorted_events.each { |event| puts event }
    end
  end
end
