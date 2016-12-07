require 'rubygems'
require 'wirble'

Wirble.init
Wirble.colorize

if defined?(ActiveRecord::Base)
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end

