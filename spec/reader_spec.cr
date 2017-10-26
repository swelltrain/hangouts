require "./spec_helper"
include Hangouts

describe Reader do
  context "getters" do
    describe "#conversation_id" do
      it "defaults to nil" do
        Reader.new("file").conversation_id.should eq("")
      end

      it "accepts a value" do
        Reader.new("file", conversation_id: "spec").conversation_id.should eq("spec")
      end
    end
  end
end
