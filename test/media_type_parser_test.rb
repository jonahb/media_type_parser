# encoding: ASCII-8BIT

require File.join( File.dirname( __FILE__ ), '..', 'lib', 'media_type_parser' )
require 'minitest/autorun'

class MediaTypeParserTest < MiniTest::Unit::TestCase

  def test_utf16_string_fails
    assert_nil MediaTypeParser.parse "t/s".encode( Encoding::UTF_16BE )
  end

  def test_ascii_8bit_strings_returned
    result = MediaTypeParser.parse( "t/s; a=b".force_encoding( Encoding::UTF_8 ) )
    assert result
    assert_equal result[ 0 ].encoding, Encoding::ASCII_8BIT
    assert_equal result[ 1 ].encoding, Encoding::ASCII_8BIT
    assert_equal result[ 2 ][ 0 ][ 0 ].encoding, Encoding::ASCII_8BIT
    assert_equal result[ 2 ][ 0 ][ 1 ].encoding, Encoding::ASCII_8BIT
  end

  def test_parse
    {
      "" => nil,

      # no parameters
      "t/s" => [ "t", "s", [] ],
      "tt/ss" => [ "tt", "ss", [] ],

      "t" => nil,
      "t/" => nil,
      "=t/s" => nil,
      " t/s" => nil,
      "\x80/s" => nil,
      "t/\x80" => nil,

      # parameters
      "t/s;a=b" => [ "t", "s", [["a", "b"]] ],
      "t/s; a=b" => [ "t", "s", [["a", "b"]] ],
      "t/s ;a=b" => [ "t", "s", [["a", "b"]] ],
      "t/s ; a=b" => [ "t", "s", [["a", "b"]] ],
      "t/s; a=b; a=c" => [ "t", "s", [["a", "b"], ["a", "c"]] ],
      "t/s; a=b; c=d" => [ "t", "s", [["a", "b"], ["c", "d"]] ],

      "t/s;" => nil,
      "t/s;=b" => nil,
      "t/s;\x80=b" => nil,
      "t/s;a=" => nil,
      "t/s;a=\x80" => nil,
      "t/s;a =b" => nil,
      "t/s;a= b" => nil,

      # quoted strings as parameter values
      't/s;a="b"' => [ "t", "s", [["a", "b"]] ],
      "t/s;a=\"\x80\"" => [ "t", "s", [["a", "\x80"]] ],
      "t/s;a=\" \"" => [ "t", "s", [["a", " "]] ],
      "t/s;a=\"\t\"" => [ "t", "s", [["a", "\t"]] ],

      "t/s;a=\"\x00\"" => nil,
      "t/s;a=\"\\\"" => nil,
      "t/s;a=\"\"\"" => nil,
      "t/s;a=\"\"\"\"" => nil,

      # quoted strings with escaped characters as parameter values
      "t/s;a=\"\\ \"" => [ "t", "s", [["a", " "]] ],
      "t/s;a=\"\\\t\"" => [ "t", "s", [["a", "\t"]] ],
      "t/s;a=\"\\\xff\"" => [ "t", "s", [["a", "\xff"]] ],
      "t/s;a=\"\\b\"" => [ "t", "s", [["a", "b"]] ],
      "t/s;a=\"\\\\\"" => [ "t", "s", [["a", "\\"]] ],

      "t/s;a=\"\\\x7f\"" => nil,
      "t/s;a=\"\\\x00\"" => nil,

      # real-world examples
      "application/atom+xml" => [ "application", "atom+xml", [] ],
      "text/html; charset=UTF-8" => [ "text", "html", [["charset", "UTF-8"]] ],
      'audio/ogg; codecs=flac' => [ "audio", "ogg", [["codecs", "flac"]] ],
      'video/mp4; codecs="avc1.42E01E, mp4a.40.2"' => [ "video", "mp4", [["codecs", "avc1.42E01E, mp4a.40.2"]] ],
    }.
    each do |string, result|
      assert_equal result, MediaTypeParser.parse( string )
    end
  end

end