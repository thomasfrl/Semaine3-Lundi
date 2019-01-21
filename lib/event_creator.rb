require_relative './user.rb'
require_relative './event.rb'
require 'time'

class EventCreator
	def initialize()
		puts "Salut, tu veux créer un événement ? Cool !"
		puts "Commençons, quel est le nom de l'événement ?"
		print "> "
		title = gets.chomp
		puts
		puts "Super, quand aura-t-il lieu ?"
		print "> "
		start_date = gets.chomp
		puts
		puts "Au top, combien de temps en minutes va-t-il durer ?"
		print "> "
		lenght = gets.chomp.to_i
		puts
		puts "Génial, qui va participer ? Balance leurs emails"
		print "> "
		attendees = gets.chomp.delete(" ").split(";").map { |attendee| User.new(attendee) }
		puts "Super, c'est noté, à bientôt !"
		return Event.new(start_date,lenght,title,attendees)
	end
end