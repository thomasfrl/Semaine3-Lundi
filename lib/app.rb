require 'rubocop'
require 'rspec'
require 'pry'
require_relative './user.rb'
require_relative './event.rb'
require_relative './event_creator.rb'


thomas = User.new("premier.mail")
mathiieru = User.new("encore.mail")
liste = User.all

fete = Event.new("2019-02-13 09:00",10,"bidule",liste)

puts fete
puts "Voici l'email du premier attendee de l'événement : #{fete.attendees.first.email}"
puts User.find_by_email("premier.mail")
puts User.find_by_email("preklmier.mail")

super_fete = EventCreator.new

puts super_fete