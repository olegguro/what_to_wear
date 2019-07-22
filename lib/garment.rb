class Garment
  attr_reader :name, :type, :temp_range

  def self.from_file(file)
    content = File.readlines(file, chomp: true)
    temps = content[2].scan(/\-?\d+/).map(&:to_i)
    temp_range = temps[0]..temps[1]
    
    new(content[0], content[1], temp_range)
  end

  def initialize(name, type, temp_range)
    @name = name
    @type = type
    @temp_range = temp_range 
  end

  def suits_for?(temp)
    temp_range.include?(temp)
  end

  def to_s
    "#{name} (#{type} #{temp_range})"
  end
end
