require 'spec_helper'

module Codebreaker
  describe Game do
    let(:output) { double('output').as_null_object }
    let(:game)   { Game.new(STDOUT) }

    describe "#start" do
      it "sends a welcome message" do
        output.expect(:puts).with('Welcome to Codebreaker!')
        game.start('1234')
      end

      it "prompts for the first guess" do
        output.expect(:puts).with('Enter guess:')
        game.start('1234')
      end
    end

    describe "#guess" do
      context "with no matches" do
        it "sends a mark with ''" do
          game.start('1234')
          output.expect(:puts).with('')
          game.guess('5555')
        end
      end
    end
  end
end