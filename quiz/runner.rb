require_relative 'quiz'
require_relative 'input_reader'
require_relative 'file_writer'
require_relative 'statistics'
require_relative 'engine'

module QuizName
  class Runner
    def initialize(bot)
      @quiz = Quiz.instance
      @input_reader = InputReader.new
      @bot = bot
    end

    def run
      @bot.listen do |message|
        case message.text
        when '/start'
          username = message.from.first_name + " " + message.from.last_name
          start_time = Time.now
          answer =
          Telegram::Bot::Types::ReplyKeyboardMarkup.new(
            keyboard: [
              [{text: "ПОЧАТИ!"}],
            ],
            one_time_keyboard: true
          )
          text = username + ", "+ "щоб розпочати тестування натисніть кнопку ПОЧАТИ!\n/start, щоб почати.\n/stop, щоб зупинитись.\n/c 0, щоб вибрати запитання, де 0 це номер запитання."
          @bot.api.send_message(chat_id: message.chat.id, text: , reply_markup: answer)
          engine = Engine.new(@bot, message.chat.id, username)
          engine.start_bot

        when '/stop'
          result = engine #.result
          end_time = Time.now

          puts start_time
          puts end_time

          @bot.api.send_message(chat_id: message.chat.id, text: "До зустрічі, #{message.from.first_name}")
        else
          answer =
          Telegram::Bot::Types::ReplyKeyboardMarkup.new(
            keyboard: [
              [{text: "/start"}],
              [{text: "/stop"}]
            ],
            one_time_keyboard: true
          )
          @bot.api.send_message(chat_id: message.chat.id, text: "починай", reply_markup: answer)
        end
      end
    end
  end
end
  