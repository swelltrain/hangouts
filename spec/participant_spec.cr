require "./spec_helper"
include Hangouts

describe Participant do
  context "getters" do
    describe "#name" do
      it "gets the name" do
        Participant.new("gaia", "id", "spec", "phone").name.should eq "spec"
      end
    end

    describe "#gaia_id" do
      it "gets the gaia_id" do
        Participant.new("gaia", "id", "spec", "phone").gaia_id.should eq "gaia"
      end
    end

    describe "#chat_id" do
      it "gets the chat_id" do
        Participant.new("gaia", "id", "spec", "phone").chat_id.should eq "id"
      end
    end

    describe "#phone_number" do
      it "gets the phone_number" do
        Participant.new("gaia", "id", "spec", "phone").phone_number.should eq "phone"
      end
    end
  end
end
