require 'yaml'
require 'erb'
require 'logger'
require 'rubygems'
require 'active_support/core_ext/string/inflections'

# First, set load path.
$LOAD_PATH.unshift(File.join(File.expand_path(File.dirname(__FILE__), './lib')))
# We use ERB so we can use constants in config.
APP_CONFIG = YAML::load(ERB.new(File.read(File.join(File.dirname(__FILE__), './config/config.yml'))).result)

APP_ENV = 'development'

APP_CONFIG[:global][:classes].each do |klass|
  require "monitor_#{klass}"

  monitor = "SysMonitor::Monitor#{klass.to_s.capitalize}".constantize.new
  monitor.do_monitoring
end

