# Module containing all monitor classes.
#
# == Info
# * *Package*    Monitor
#
module Monitor
    
  # Main monitor abstract class.
  # All other monitors extend it.
  #
  # == Info
  # * *Package*    Monitor
  #
  class Base
    def initialize
      logfile = File.join(File.dirname(__FILE__), '../log/monitor.log')
      @log = Logger.new(logfile, 'weekly')
      @log.level = Logger::DEBUG
    end
  end

  # Module containing methods used in all monitoring classes.
  #
  # == Info
  # * *Package*    Monitor
  #
  module Misc
    def decode_size(bytes)
      types = ['B', 'KiB', 'MiB', 'GiB', 'TiB']
      i = 0
      while bytes >= 1024 && i < (types.length) - 1
        bytes /= 1024
        i += 1
      end

      return ("%.02f" % bytes).to_s + ' ' + types[i].to_s
    end
  end
end
