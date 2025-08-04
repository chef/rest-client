#
# Gemspec for Windows platforms. We can't put these in the main gemspec because
# it results in bundler platform hell when trying to build the gem.
#
# Set $BUILD_PLATFORM when calling gem build with this gemspec to build for
# Windows platforms like x86-mingw32.
#
# License: MIT (same as rest-client.gemspec)
#

gemspec_path = File.join(File.dirname(__FILE__), "rest-client.gemspec")
s = Gem::Specification.load(gemspec_path) || raise("Could not load gemspec at #{gemspec_path}")

# Set the name to match what Gemfile expects
s.name = "rest-client.windows"
s.license = "MIT"

# Set the name to match what Gemfile expects
s.name = "rest-client.windows"

# Clear the executables to avoid conflicts with the main gem
s.executables = []

platform = ENV["BUILD_PLATFORM"] || RUBY_PLATFORM


case platform
when /(mingw|mswin)/
  # ffi is needed for RestClient::Windows::RootCerts
  s.add_dependency "ffi", ">= 1.15.5", "<= 1.16.3"
  s.platform = platform
end

s
