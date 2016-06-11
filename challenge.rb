require 'sinatra'
require 'data_mapper'
require 'tux'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/nri_challenge.db")

#schema
class Question
	include DataMapper::Resource
	property :id, Serial	
	property :strand_id, Integer
	property :strand_name, Text
	property :standard_id, Integer
	property :standard_name, Text
	property :question_id, Integer
	property :difficulty, Text 
	property :created_at, DateTime
	property :updated_at, DateTime
end

DataMapper.auto_upgrade!

#routes
get "/" do 
	@questions =  Question.all
	@title = "Here's a list of all the questions:"
	erb :home
end

post "/" do
	@amt_of_questions = params[:amt_of_questions]
	redirect "/questions"	
end

get "/questions" do
	@title = "Great! Here's a list of the questions for the day:"
	@amt_of_questions
	erb :questions, :locals => {:home => params[:amt_of_questions]}
end


