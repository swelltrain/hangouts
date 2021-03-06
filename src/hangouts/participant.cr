module Hangouts
  class Participant
    getter :gaia_id, :chat_id, :name, :phone_number

    def initialize(gaia_id : String, chat_id : String, name : String, phone_number = "")
      @gaia_id = gaia_id
      @chat_id = chat_id
      @name = name
      @phone_number = phone_number
    end

    def ==(other : Participant)
      name == other.name
    end
  end
end
