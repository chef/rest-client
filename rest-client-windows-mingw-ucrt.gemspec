#
# Gemspec for Windows MINGW UCRT platforms. We can't put these in the main gemspec because
# it results in bundler platform hell when trying to build the gem.
#
# Set $BUILD_PLATFORM when calling gem build with this gemspec to build for
# Windows platforms like x86-mingw-ucrt, x64-mingw-ucrt.
#

# Load the main gemspec with proper path resolution
gemspec_path = File.join(File.dirname(__FILE__), 'rest-client.gemspec')
gemspec = eval(File.read(gemspec_path), binding, gemspec_path)

platform = ENV['BUILD_PLATFORM'] || RUBY_PLATFORM

case platform
when /(mingw-ucrt|mingw32|mswin32)/
  # Set the platform for Windows builds
  # Note: FFI dependency is now handled by the main gemspec for Windows platforms
  gemspec.platform = platform
end

gemspec