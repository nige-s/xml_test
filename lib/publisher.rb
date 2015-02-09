class Publisher
  include ROXML

  xml_accessor :name

  def initialize(name = nil)
    @name = name
  end

  def ==(other)
    name == other.name
  end

  # other important functionality

end