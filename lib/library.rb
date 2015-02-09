class Library
  include ROXML

  xml_accessor :name, :from => "NAME", :cdata => true
  xml_accessor :novels, :as => [Novel] # by default roxml searches for books for in <novel> children, then, if none are present, in ./novels/novel children

  def ==(other)
    name == other.name && novels == other.novels
  end
end