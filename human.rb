class Human 
	attr_accessor :last_name, :first_name, :middle_initial, :favorite_color, :date_of_birth
	def initialize(last_name, first_name, *middle_initial, favorite_color, date_of_birth)
		@last_name = last_name
		@first_name = first_name
		@middle_initial = middle_initial
		@favorite_color = favorite_color
		@date_of_birth = date_of_birth						
		puts "This is a human"
	end
end

h = Human.new("Bowie", "David", "Male", "Pink", "01-08-1947")

p h

