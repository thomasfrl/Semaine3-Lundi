require 'time'

class DateParser

	def search_hour(date)
		#cherhe l'heure
		date.each do |date_word|
			if date_word =~ /\d+h\d*/i
				hour = date_word.split("h")
				return hour = hour[0].to_i*3600 + hour[1].to_i*60
			else
				return hour = 0
			end
		end
	end

	def search_year(date)
		#cherche l'année
		date.each do |date_word|
			if date_word =~ /2\d{3}/i
				return year = date_word.delete(" ").to_i
			else
				return year = Time.now.year
			end
		end
	end

	def search_month(date)
		#cherche le mois
		list_month = ["janvier","f[ée]vrier","mars","avril","mai","juin","juillet","ao[ûu]t","septembre","octobre","novembre","d[ée]cembre"]
		date.each do |date_word|
			list_month.each_with_index do |m,i|
				if date_word =~ /#{m}/i
					return month = i+1
				else
					return month = Time.now.month
				end
			end
		end
	end

	def search_day(date)
		#cherche le jour du mois
		date.each do |date_word|
			if date_word =~ /[^h]?\d{1,2}[^h]?/i
				return day = date_word.to_i
			end
		end
	end

	def search_day_week(date)
		list_day = ["lundi","mardi","mercredi","jeudi","vendredi","samedi","dimanche"]
		#cherche le jour de la semaine
		date.each do |date_word|
			list_day.each_with_index do |d,i|
				if date_word =~ /#{d}/i
					return day = i+1
				end
			end
		end
	end

	def search_today_day(day_today)
		#retourne le jour le semaine du jour actuel
		if day_today.monday?
			return 1
		elsif day_today.tuesday?
			return 2
		elsif day_today.wednesday?
			return 3
		elsif day_today.thursday?
			return 4
		elsif day_today.friday?
			return 5
		elsif day_today.saturday?
			return 6
		elsif day_today.sunday?
			return 7
		end		
	end

	def nb_day_month(month)
		#retourne le nombre de jour dans le mois de l'event
		case month
		when 1,3,5,7,8,10,12
			return 31
		when 4,6,9,11
			return 30
		when 2
			return 28
		end
	end


	def initialize(date)
		date = date.downcase.split

		if search_day_week(date) == false  #&& key_word_search(date) == false
			hour = search_hour(date)			
			return Time.new(search_year(date),search_month(date),search_day(date))+ hour
		else #&& key_word_search == true
			hour = search_hour(date)
			year = search_year(date)
			month = search_month(date)
			
			today_day = Time.now.day
			today_day_week = search_today_day(Time.now)
			day = search_day_week(date)

			#determine le jour du mois 1-31
			if  day > today_day_week
				day = today_day + day - today_day_week
			else
				day = today_day - today_day_week + 7 + day
			end

			if day > nb_day_month(month)
				month +=1
				day = day - nb_day_month(month)
			end

			if month > 12
				year += 1
				month = 1
			end
			@year = year
			@month = month
			@day = day
			@hour = hour
			return Time.new(year,month,day) + hour
		end
	end

	def to_s
		(Time.new(@year,@month,@day) + @hour).to_s
	end
end
=begin
		#@list_trash_word = ["le","à","la","les","au","a"]
		#retire les mots inutils
		@list_trash_word.each do |trash_word|
			date.each do |date_word|
				if date_word == trash_word
					date.delete(trash_word)
				end
			end
		end
	

	@list_key_word = ["prochain","suivant","prochaine","suivante"]
	def key_word_search(date)
	#cherche les mots clefs
		@list_key_word.each do |key_word|
			date.each_with_index do |date_word,i|
				if date_word == key_word
					return true
				else 
					return false
				end
			end
		end
	end
	
=end