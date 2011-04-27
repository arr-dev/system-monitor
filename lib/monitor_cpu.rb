require 'sys_monitor'
module SysMonitor
  class MonitorCpu < SysMonitor::Base

    include Misc
    def initialize
      super
    end

    def do_monitoring
      load = IO.read(CPU_FILE)
      load_avg = load.split(' ')
      CPU_CHECKS.each do |check|
        const_val = class_module_name(self).constantize.const_get("LOAD_AVG_#{check.upcase}_MIN")
        @log.info "Load #{check} min: " + load_avg[const_val]
        if load_avg[const_val].to_i > @config[:cpu][:limit]["#{check}_min".to_sym]
          puts const_val
        end
      end
    end
  end
end