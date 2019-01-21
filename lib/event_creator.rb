require_relative './user.rb'
require_relative './event.rb'
require 'time'
require_relative './date_parser.rb'

class EventCreator
	def initialize()
		puts "Salut, tu veux créer un événement ? Cool !"
		puts "Commençons, quel est le nom de l'événement ?"
		print "> "
		title = gets.chomp
		puts
		puts "Super, quand aura-t-il lieu ?"
		print "> "
		start_date = (DateParser.new(gets.chomp)).to_s
		puts
		puts "Au top, combien de temps en minutes va-t-il durer ?"
		print "> "
		lenght = gets.chomp.to_i
		puts
		puts "Génial, qui va participer ? Balance leurs emails"
		print "> "
		attendees = gets.chomp.delete(" ").split(";").map { |attendee| User.new(attendee) }
		puts "Super, c'est noté, à bientôt !"
		puts Event.new(start_date,lenght,title,attendees)
	end
end