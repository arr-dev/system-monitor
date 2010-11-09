
# First, set load path.
$LOAD_PATH.unshift(File.join(File.expand_path(File.dirname(__FILE__), './lib')))

require 'monitor_ping'

monitor = MonitorPing.new
monitor.do_monitoring