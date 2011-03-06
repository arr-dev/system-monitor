require 'yaml'

# First, set load path.
$LOAD_PATH.unshift(File.join(File.expand_path(File.dirname(__FILE__), './lib')))
CONFIG = YAML::load_file(File.join(File.dirname(__FILE__), './config/config.yml'))

APP_ENV = 'development'

CONFIG[:global][:classes].each do |klass|
  require "monitor_#{klass}"

  monitor = "Monitor#{klass.to_s.capitalize}".constantize.new
  monitor.do_monitoring
end