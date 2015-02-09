class XmlTestController < ApplicationController
attr_reader :xml

  def index
    @xml = even_more_xml
    lib = Library.from_xml(@xml)
    puts lib
  end

  def create_xml
    b = Nokogiri::XML::Builder.new do |xml|
      xml.send(:'foo-bar') {
        xml.send(:'bar-foo', 'hello')
      }
    end

    b.to_xml
  end

  def parse_xml
    doc = Nokogiri::XML(more_xml)
    doc.xpath('//node1').each do |node|
      puts node.text
      puts 'tessssssssssst'
      puts 'end'
    end
  end

  def more_xml
    xml = Nokogiri::XML::Builder.new { |xml|
      xml.body do
        xml.node1 "some string"
        xml.node2 123
        xml.node3 do
          xml.node3_1 "another string"
        end
        xml.node4 "with attributes", :attribute => "some attribute"
        xml.selfclosing
      end
    }.to_xml
  end

  def even_more_xml
    book = Novel.new
    book.isbn = "0201710897"
    book.title = "The PickAxe"
    book.description = "Best Ruby book out there!"
    book.author = "David Thomas, Andrew Hunt, Dave Thomas"

    lib = Library.new
    lib.name = "Favorite Books"
    lib.novels = [book]
    doc = Nokogiri::XML::Document.new
    doc.root = lib.to_xml
    open("library.xml", 'w') do |file|
      file << doc.serialize
    end
    doc
  end
end
