require 'sys_monitor'

class MonitorCpu < SysMonitor::Base
  CPU_FILE = '/proc/loadavg'
  CHECKS = ['ONE', 'FIVE', 'FIFTEEN']
  LOAD_AVG_ONE_MIN = 0
  LOAD_AVG_FIVE_MIN = 1
  LOAD_AVG_FIFTEEN_MIN = 2

  include SysMonitor::Misc
  def initialize
    super
  end

  def do_monitoring
    load = IO.read(CPU_FILE)
    load_avg = load.split(' ')
    CHECKS.each do |check|
      @log.info "Load #{check} min: " + load_avg["#{self.class}::LOAD_AVG_#{check}_MIN".constantize]
      if load_avg["LOAD_AVG_#{check}_MIN".constantize].to_i > @config[:cpu][:limit]["#{check.downcase}_min".to_sym]

      end
    end
  end
end
