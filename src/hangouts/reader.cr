require "json"

module Hangouts
  class Reader
    getter :conversation_id
    private getter :filename

    def initialize(filename : String, verbose = false, conversation_id = "")
      @filename = filename
      @verbose = verbose
      @conversation_id = conversation_id
    end

    def call
      json = parse_json_file
      conversations(json)
    end

    def parse_json_file
      raw_json = File.read(filename)
      JSON.parse(raw_json)
    end

    def conversations(json : JSON::Any)
      conversations = Array(Conversation).new
      json["conversation_state"].each do |conversation_data|
        conversations << conversation_from_data(conversation_data)
      end
      conversations
    end

    def conversation_from_data(data : JSON::Any)
      Hangouts::ConversationBuilder.new(data).call
    end
  end
end
