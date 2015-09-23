class Person < PeopleFinder
  require 'date'

  attr_reader :last_name, :first_name, :middle_initial, :gender, :favorite_color

  def post_initialize(args={})
    @last_name      = args[:last_name]
    @first_name     = args[:first_name]
    @middle_initial = args[:middle_initial]
    @gender         = normalize_gender( args[:gender] )
    @dob            = normalize_dob( args[:date_of_birth] )
    @favorite_color = args[:favorite_color]
  end

  def date_of_birth(date_format="%-m/%-d/%Y")
    @dob.strftime(date_format)
  end

  def inspect
    "#{last_name} #{first_name} #{gender} #{date_of_birth} #{favorite_color}"
  end

  private

  def normalize_gender(gender)
    return nil if not gender
    return "Male" if gender.match(/(M|Male)/i)
    return "Female" if gender.match(/(F|Female)/i)
    nil
  end

  def normalize_dob(date_of_birth)
    return nil if not date_of_birth
    DateTime.strptime(date_of_birth.gsub('-','/'), '%m/%d/%Y')
  end

end
