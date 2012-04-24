require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 10000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

# IRBRC file by Iain Hecker, http://iain.nl
# put all this in your ~/.irbrc
require 'rubygems'
require 'yaml'

alias q exit

class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end

