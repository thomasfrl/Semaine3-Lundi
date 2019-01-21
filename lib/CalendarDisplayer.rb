class CalendarDisplayer
	attr_accessor :list_event, :date
	@number_row
	@first_day
	@last_day
	@nb_day_month
	
	def print_legend
		puts
		print " "*6 + "Su" + " "*8 + "Mo" + " "*8 + "Tu" + " "*8 + "We" + " "*8 + "Th" + " "*8 + "Fr" + " "*8 + "Sa\n"
		print "  " + "-"*71
	end


	def first_day
		@first_day = search_week_day(@date) - @date.day%7 + 1
		@first_day += 7 if @first_day < 1
	end

	def last_day
		@last_day = @first_day + @nb_day_month%7
		@last_day -= 7 if @last_day > 7
	end

	def nb_day_month
		#retourne le nombre de jour dans le mois de l'event
		case @date.month
		when 1,3,5,7,8,10,12
			return @nb_day_month = 31
		when 4,6,9,11
			return @nb_day_month = 30
		when 2
			return @nb_day_month = 28
		end
	end


	def number_row
		@number_row = (@first_day + @nb_day_month)/7.to_i + 1
	end

	def is_event?(date_case)
		list_event.each do |event|
			return true if (event.start_date.day == date_case.day) && (event.start_date.month == date_case.month) && (event.start_date.year == date_case.year)
		end
		return false
	end

	def is_date?(position)
		case position[1]
		when 1...@number_row-1
			return true
		when 0
			return true if (position [0]+1) >= @first_day
		when @number_row-1
			return true if (position [0]+1) < @last_day
		end
		#binding.pry
	end

	def date_case(position)
		day_case = (position[0]+1) + position[1]*7 - @first_day + 1
		#binding.pry
		return Time.new(@date.year , @date.month , day_case)
	end

	def day_case(position)
		return (position[0]+1) + position[1]*7 - @first_day + 1		
	end

	def find_event_by_date(date_case)
		@list_event.each do |event|
			if event.start_date.day == date_case.day && event.start_date.month == date_case.month && event.start_date.year == date_case.year
				return event
			end
		end
	end

	def print_line1(position)
		if is_date?(position) == nil
			print " "*9
		else 
			print day_case(position).to_s + " "*(9 - day_case(position).to_s.length)
		end
	end

	def print_line2(position)
		if is_date?(position) == nil
			print " "*9
		else 
			#binding.pry
			if is_event?(date_case(position))
				event = find_event_by_date(date_case(position))
				#binding.pry
				hour = event.start_date.hour.to_s + ":" + event.start_date.min.to_s
				print hour + " "*(9-hour.length)
			else
				print " "*9
			end
		end
	end

	def print_line3(position)
		if is_date?(position) == nil
			print " "*9
		else 
			if is_event?(date_case(position))
				event = find_event_by_date(date_case(position))
				title = event.title[0..7]
				print title + " "*(9 - title.length)
			else
				print " "*9
			end
		end
	end

	def print_line4_5(position)
		print " "*9
	end

	def search_week_day(date)
	#retourne le jour le semaine 
		if date.monday?
			return 1
		elsif date.tuesday?
			return 2
		elsif date.wednesday?
			return 3
		elsif date.thursday?
			return 4
		elsif date.friday?
			return 5
		elsif date.saturday?
			return 6
		elsif date.sunday?
			return 7
		end		
	end

	def print_line(methode)
		print "  "
		7.times do |i|
			position = [i,j]
			print "|"
			methode(position)
		end
		print "|\n"
	end

	def to_s
		print_legend
		print "\n"
		number_row.times do |j|
			#print_line("print_line1")	
			print "  "
			7.times do |i|
				position = [i,j]
				print "|"
				print_line1(position)
			end
			print "|\n"
			print "  "
			7.times do |i|
				position = [i,j]
				print "|"
				print_line2(position)
			end
			print "|\n"
			print "  "
			7.times do |i|
				position = [i,j]
				print "|"
				print_line3(position)
			end
			print "|\n"
			print "  "
			2.times do
				7.times do |i|
					position = [i,j]
					print "|"
					print_line4_5(position)
				end
				print "|\n"
				print "  "
			end
			print "-"*71 + "\n"
		end
	end

	def initialize(list_event,date)
		@list_event = list_event
		@date = Time.parse(date)
		first_day
		nb_day_month
		last_day
		number_row
	end
end