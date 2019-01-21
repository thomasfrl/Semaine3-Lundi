require 'rubocop'
require 'rspec'
require 'pry'
require 'time'
require_relative './user.rb'
require_relative './event.rb'
require_relative './event_creator.rb'
require_relative './CalendarDisplayer.rb'


thomas = User.new("premier.mail")
mathiieru = User.new("encore.mail")
liste = User.all
#puts liste

fete = Event.new("2019-02-13 09:00",10,"bidule",liste)
fete2 = Event.new("2019-02-08 08:30",10,"truc",liste)
fete4 = Event.new("2019-02-16 11:15",10,"machin",liste)
fete3 = Event.new("2019-02-24 09:00",10,"chose",liste)

#puts fete
#puts "Voici l'email du premier attendee de l'événement : #{fete.attendees.first.email}"
#puts User.find_by_email("premier.mail")
#puts User.find_by_email("preklmier.mail")

#super_fete = EventCreator.new

#puts super_fete

calendrier = CalendarDisplayer.new([fete,fete2,fete3,fete4],"2019-02-13 09:00")

puts calendrier