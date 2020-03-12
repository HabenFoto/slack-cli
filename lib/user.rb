require 'dotenv'
require 'httparty'
require 'awesome_print'
require_relative 'recipient'
  
  
Dotenv.load
  
class Users < Recipient
  attr_reader :topic, :number_of_users

      
  USERS_URL = "https://slack.com/api/users.list?"
  SLACK_TOKEN = ENV["SLACK_TOKEN"]


  def initialize

  end

  def self.list_all

  query = {
    token: SLACK_TOKEN, 
  }

    users = HTTParty.get(USERS_URL, query: query)
    users["members"].each do |user|
      ap user["name"]
    end
    
  end    
end

puts Users.list_all