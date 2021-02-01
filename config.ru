require 'bundler'
$:.unshift(File.expand_path("./../lib", __FILE__)) 
require './controller'
run MyApp
gem 'shotgun'
gem 'csv'



