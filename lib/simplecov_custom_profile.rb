require 'simplecov'
SimpleCov.profiles.define 'myprofile' do
  
  add_filter 'vendor' # Don't include vendored stuff
end