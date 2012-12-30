media_type_parser
=================

An [Internet media type](http://en.wikipedia.org/wiki/Internet_media_type) parser implemented with [Treetop](http://treetop.rubyforge.org).

    MediaTypeParser.parse( "application/rss+xml" )
    => ["application", "rss+xml", []]

    MediaTypeParser.parse( "text/html; charset=UTF-8" )
    => ["text", "html", [["charset", "UTF-8"]]]

    MediaTypeParser.parse( 'video/ogg; codecs="theora, vorbis"' )
    => ["video", "ogg", [["codecs", "theora, vorbis"]]]
