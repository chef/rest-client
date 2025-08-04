source "https://rubygems.org"

if !!File::ALT_SEPARATOR
  gemspec name: "rest-client.windows"
else
  gemspec name: "rest-client"
end

group :test do
  gem "rake"
end

# Default gems moving out on their own starting with Ruby 3.4
gem "base64"
