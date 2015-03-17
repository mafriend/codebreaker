require "Codebreaker"

class Output
  def messages
    @messages ||= []
  end

  def puts(message)
    messages << message
  end
end

def msg_out
  @output ||= Output.new
end

Given /^I am not yet playing$/ do
end

When /^I start a new game$/ do
  @messenger = StringIO.new
  game = Codebreaker::Game.new(@messenger)
  game.start('1234')
end

Then /^I should see "([^"]*)"$/ do |message|
  expect(@messenger.string.split("\n")).to include(message)
end

Given /^the secret code is "([^"]*)"$/ do |secret|
  game = Codebreaker::Game.new(STDOUT)
  game.start(secret)
end

When /^I guess "([^"]*)"$/ do |guess|
  game = Codebreaker::Game(STDOUT)
  game.guess(guess)
end

Then /^the mark should be "([^"]*)"$/ do |mark|
  output.messages.should include(mark)
end