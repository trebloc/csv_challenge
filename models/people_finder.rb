class PeopleFinder

  def initialize(args={})
    add_person
    post_initialize(args)
  end

  def post_initialize(args) # subclasses may override
    nil
  end

  def self.all
    @people ||= []
  end

  def self.sort_by_last_name
    all.sort_by{|person| person.last_name}
  end

  def self.sort_by_last_name_descending
    sort_by_last_name.reverse
  end

  def self.sort_by_birth
    all.sort_by{|person| person.date_of_birth("%Y/%m/%d")}
  end

  def self.sort_by_gender
    groupings = sort_by_last_name.group_by{|person| person.gender }
    groupings['Female'] + groupings['Male']
  end


  def self.render(sort=:all)
    self.send(sort).map { |item| item.inspect }.join("\r\n")
  end

  private

  def add_person
    self.class.all << self
  end

end
