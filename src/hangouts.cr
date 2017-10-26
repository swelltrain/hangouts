require "./hangouts/*"

module Hangouts
  conversations = Reader.new("/Users/stephen/crystal/hangouts/data/hangouts.json").call
  counter = 0
  conversations.each do |conversation|
    melanie = Participant.new("103495081214667156826", "id", "Melanie Barnett", "phone")
    if conversation.has_participant?(melanie)
      conversation.sorted_events.each { |event| puts event }
    end

  end
end
