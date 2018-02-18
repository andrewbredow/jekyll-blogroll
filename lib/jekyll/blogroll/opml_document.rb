require "open-uri"
require "nokogiri"

module Jekyll
  module Blogroll
    class OpmlDocument
      def initialize(feed_path_or_url:)
        xml_data = open(feed_path_or_url) {|f| f.read }
        @xml = Nokogiri::XML(xml_data)
      end

      def feeds
        @_feeds ||= parse_feeds
      end

      def parse_feeds
        @xml.css('outline[type="rss"]').map do |feed_data|
          Feed.new(data: feed_data)
        end
      end

      class Feed
        attr_accessor :text, :title, :xml_url, :html_url

        def initialize(data:)
          @text = data["text"]
          @title = data["title"]
          @xml_url = data["xmlUrl"]
          @html_url = data["htmlUrl"]
        end
      end
    end
  end
end
