require 'treetop'

%w{
  media_type
}.
each do |file|
  require File.join( File.dirname( __FILE__ ), 'media_type_parser', file )
end

module MediaTypeParser

  # @param [String] string
  #
  # @return [Array, nil]
  #   If the string is valid, a three-element array: type, subtype, parameters.
  #   parameters is an array of 2-element arrays where the first element is the
  #   parameter name and the second is the parameter value. All returned
  #   strings have the the ASCII-8BIT (aka BINARY) encoding regardless of the
  #   encoding of the provided string.
  #
  #   If the string is invalid, nil.
  #
  def self.parse( string )
    result = Generated::MediaTypeParser.new.parse(
      string.dup.force_encoding( 'ASCII-8BIT' ),
      :root => 'media_type' )

    result && result.value
  end

end
