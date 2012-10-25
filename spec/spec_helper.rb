# -- coding: utf-8

require "rubygems"
require "bundler/setup"
Bundler.require :test

module You
  @score = 0
  @yaml_answers = File.exist?("answers.yml") && YAML.load_file("answers.yml")

  def self.incr
    @score += 1
  end

  def self.score
    @score
  end

  def self.engineer?
    @engineer ||= answer("エンジニア or プログラマ")
  end

  def self.answer(msg)
    if @yaml_answers
      yaml_answer(msg)
    else
      prompt(msg)
    end
  end

  def self.prompt(msg)
    puts "#{msg.gsub(/[?？]$/, "")}? (Y/n)"
    ["Y",""].include? gets.strip.upcase
  end

  def self.yaml_answer(msg)
    @yaml_answers.fetch(msg) {puts "#{msg}に答えてください"}
  end
end

RSpec.configure do |conf|

  def question(msg, required = false)
    it msg do
      answer = You.answer(msg)
      answer.should be_true if required
      You.incr if answer
    end
  end
end
