require 'telegram/bot'

require './quiz/runner'

token = '5938215316:AAGybY3ebwhlhhSRKweLTVuGELkGfcuBjxw'

Telegram::Bot::Client.run(token) do |bot|
  runner_quiz = QuizName::Runner.new(bot)
  runner_quiz.run
end
