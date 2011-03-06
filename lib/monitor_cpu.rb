require 'sys_monitor'

class MonitorCpu < SysMonitor::Base
  CPU_FILE = '/proc/loadavg'
  LOAD_AVG_ONE_MIN = 0
  LOAD_AVG_FIVE_MIN = 1

  include SysMonitor::Misc
  def initialize
    super
  end

  def do_monitoring
    load = IO.read(MonitorCpu::CPU_FILE)
    load_avg = load.split(' ')
    @log.info "Load 1 min: #{load_avg[self::LOAD_AVG_ONE_MIN]}"
    if load_avg[self::LOAD_AVG_ONE_MIN] > @config[:cpu][:limit][:one_min]
      
    end
    if load_avg[self::LOAD_AVG_FIVE_MIN] > @config[:cpu][:limit][:five_min]

    end
  end
end
