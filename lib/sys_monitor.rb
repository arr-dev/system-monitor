require 'rubygems'
require 'active_support'

# Module containing all monitor classes.
#
# == Info
# * *Package*    Monitor
#
module SysMonitor

  CPU_FILE = '/proc/loadavg'
  CPU_CHECKS = %w(one five fifteen)
  LOAD_AVG_ONE_MIN = 0
  LOAD_AVG_FIVE_MIN = 1
  LOAD_AVG_FIFTEEN_MIN = 2
  
  # Main monitor abstract class.
  # All other monitors extend it.
  #
  # == Info
  # * *Package*    Monitor
  #
  class Base
    def initialize
      @config = APP_CONFIG[APP_ENV.to_sym]

      logfile = File.join(File.dirname(__FILE__), "../log/#{APP_CONFIG[:global][:log][:filename]}")
      @log = Logger.new(logfile, 'weekly')
      @log.level = APP_CONFIG[:global][:log][:level]
      @log.formatter = proc { |severity, datetime, progname, msg|
          "#{datetime} (#{severity}): #{msg}\n"
        }
      @log.old_datetime_format = "%d-%m-%Y %H:%M:%S"

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
    
    # Get module name from class name
    # Example (returns A):
    #  class_module_name(A::B)
    def class_module_name(klass)
      klass.class.name.split("::").first
    end
  end
end
