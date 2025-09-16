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
spec.platform = ENV["BUILD_PLATFORM"] || RUBY_PLATFORM

# Only modify the spec for Windows platforms
case spec.platform
when /(mingw-ucrt|mingw32|mswin32)/
  # Ensure FFI dependency is present for Windows platforms
  # (This might already be handled in the main gemspec, but we ensure it here)
  unless spec.dependencies.any? { |dep| dep.name == "ffi" }
    spec.add_dependency("ffi", ">= 1.15.5", "< 1.18.0")
  end
end

spec
