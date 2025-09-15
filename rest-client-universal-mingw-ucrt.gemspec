#
# Gemspec for Windows MINGW UCRT platforms. We can't put these in the main gemspec because
# it results in bundler platform hell when trying to build the gem.
#
# Set $BUILD_PLATFORM when calling gem build with this gemspec to build for
# Windows platforms like x86-mingw-ucrt, x64-mingw-ucrt.
#

# Load the main gemspec and modify it for Windows platforms
main_gemspec_path = File.join(File.dirname(__FILE__), "rest-client.gemspec")
spec = Gem::Specification.load(main_gemspec_path)

spec.license = "MIT"

# Get the platform from environment or default to current Ruby platform
spec.platform = Gem::Platform.new(%w{universal mingw-ucrt})

spec.add_dependency("ffi", ">= 1.15.5", "< 1.18.0")
spec
