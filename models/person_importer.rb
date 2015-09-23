class PersonImporter
  require 'csv'

  attr_reader :filename, :options

  def initialize(config)
    @filename = config[:filename]
    @options  = {
                  col_sep: seperator( config[:delimeter] ),
                  headers: config[:headers]
                }
  end

  def each_row(&block)
    CSV.open(filename, options).each do |row|
      block.call(row.to_h)
    end
  end

  private

  def seperator(name)
    {
        "space" => "\s",
        "comma" => ",\s",
        "pipe" => "\s|\s"
    }[name]
  end

end
