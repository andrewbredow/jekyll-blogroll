require "spec_helper"

RSpec.describe Jekyll::Blogroll::OpmlDocument do
  let(:xml_path) { "#{RSPEC_ROOT}/fixtures/data.xml" }

  it "parses a list of feeds" do
    document = described_class.new(feed_path_or_url: xml_path)

    expect(document.feeds.count).to eq(4)
  end

  it "correctly parses feed information" do
    feed = described_class.new(feed_path_or_url: xml_path).feeds.first

    expect(feed.text).to eq("Cult of Mac")
    expect(feed.title).to eq("Cult of Mac Title")
    expect(feed.xml_url).to eq("http://feeds.feedburner.com/cultofmac/bFow")
    expect(feed.html_url).to eq("http://www.cultofmac.com")
  end

  it "correctly parses feed information when attributes are missing" do
    feed = described_class.new(feed_path_or_url: xml_path).feeds.last

    expect(feed.text).not_to be_nil
    expect(feed.title).not_to be_nil
    expect(feed.xml_url).not_to be_nil
    expect(feed.html_url).to be_nil
  end
end
