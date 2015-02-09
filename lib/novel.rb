class Novel
  include ROXML

  xml_accessor :isbn, :from => "@ISBN" # attribute with name 'ISBN'
  xml_accessor :title
  xml_accessor :description, :cdata => true  # text node with cdata protection
  xml_accessor :author
  xml_accessor :publisher, :as => Publisher # singular object reference for illustrative purposes.

  def ==(other)
    self.class.roxml_attrs.map(&:accessor).all? {|attr| send(attr) == other.send(attr) }
  end
end