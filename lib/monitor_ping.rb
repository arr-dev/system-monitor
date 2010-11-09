require 'monitor'
require 'ping'

class MonitorPing < Monitor::Base
  include Monitor::Misc
  def initialize
    
  end

  def do_monitoring
    response = Ping.pingecho "google.com", 10, 80
    if response
      ret = 'radi'
    else
      ret = 'ne radi'
    end
    puts self.decode_size 1024
    puts ret.inspect
  end
end
