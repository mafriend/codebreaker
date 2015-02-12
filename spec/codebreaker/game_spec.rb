require 'spec_helper'

module Codebreaker
  describe Game do
    describe "#start" do
      let(:output) { double('output').as_null_object }
      let(:game)   { Game.new(output) }

      it "sends a welcome message" do
        output.expect(:puts).with('Welcome to Codebreaker!')
        game.start('1234')
      end

      it "prompts for the first guess" do
        output.expect(:puts).with('Enter guess:')
        game.start('1234')
      end
    end
  end
end