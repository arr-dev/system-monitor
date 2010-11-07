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
      
    end
  end

  def decode_size(bytes)
    types = ['B', 'KiB', 'MiB', 'GiB', 'TiB']
    i = 0
    while bytes >= 1024 && i < (types.length) - 1
      bytes /= 1024
      i += 1
    end

    return ("%.02f" % bytes).to_s + " " + types[i].to_s
  end
end
