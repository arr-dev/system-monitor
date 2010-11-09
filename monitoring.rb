#$:.delete('.')
#$: << File.join(File.expand_path(File.dirname(__FILE__), './lib'))

puts $:.inspect
require 'lib/monitor_ping'

puts $:.inspect

monitor = MonitorPing.new
monitor.do_monitoring