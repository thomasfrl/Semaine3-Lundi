require_relative './user.rb'

class Event
	attr_accessor :start_date, :lenght, :title, :attendees

	def initialize(start_date,lenght, title, attendees)
		@start_date = Time.parse(start_date)
		@lenght = lenght
		@title = title
		@attendees = attendees
	end

	def postpone_24h
		@start_date += 60*60*24
	end	

	def end_date
		@start_date + @lenght*60
	end

	def is_past
		Time.now < @start_date
	end

	def is_future
	  !self.is_past
  end

  def is_soon
  	@start_date - Time.now < 30*60
  end

  def to_s
  	puts ("Titre : #{@title}")
  	puts ("Date de début : #{@start_date}")
  	puts ("Durée : #{lenght} minutes")
  	list_attendees = String.new
  	attendees.each {|attendee| list_attendees += attendee.email + " "}
  	puts ("Invités : #{list_attendees}")
  end

  

end

