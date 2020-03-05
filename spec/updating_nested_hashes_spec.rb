require_relative 'spec_helper'
require_relative '../lib/updating_nested_hashes.rb'

describe "update_status" do
	it "returns a hash where the hero and heroine's status is set to dead" do
    expect(update_status[:montague][:hero][:status]).to eq("dead")
    expect(update_status[:capulet][:heroine][:status]).to eq("dead")
  end
end

describe "add_characters" do
  describe "returns a hash" do
    it "with an :additional_characters key that is assigned an array" do
      expect(add_characters).to be_a(Hash)
      expect(add_characters[:additional_characters]).to be_an(Array)
    end

    it "the :additional_characters array contains two hashes" do
      expect(add_characters[:additional_characters].length).to eq(2)
      expect(add_characters[:additional_characters][0]).to be_a(Hash)
      expect(add_characters[:additional_characters][1]).to be_a(Hash)
    end

    it "the :additional_characters array contains two hashes" do
      expect(add_characters[:additional_characters].length).to eq(2)
      expect(add_characters[:additional_characters][0]).to be_a(Hash)
      expect(add_characters[:additional_characters][1]).to be_a(Hash)
    end

    it "the two hashes in :additional_characers have :name keys containing strings" do
      expect(add_characters[:additional_characters][0][:name]).to be_a(String)
      expect(add_characters[:additional_characters][1][:name]).to be_a(String)
    end

    it "the first hash contains the name 'Prince Escalus'" do
      expect(add_characters[:additional_characters][0][:name]).to eq("Prince Escalus")
    end

    it "the second hash contains the name 'Apothecary'" do
      expect(add_characters[:additional_characters][1][:name]).to eq("Apothecary")
    end
  end

end
