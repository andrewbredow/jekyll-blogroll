require "bundler/setup"
require "pry"

require "jekyll/blogroll"
require "jekyll/blogroll/opml_document"

RSPEC_ROOT = File.dirname __FILE__

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
