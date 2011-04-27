require 'sys_monitor'
require 'ping'
module SysMonitor
  class MonitorPing < SysMonitor::Base
    include SysMonitor::Misc
    def initialize
      super
    end

    def do_monitoring
      @config[:ping][:host].each do |host|
        response = Ping.pingecho host, @config[:ping][:timeout], @config[:ping][:port]
        if response
          @log.debug "Host #{host} is online"
        else
          @log.error "Host #{host} is offline"
        end
      end
    end
  end
end