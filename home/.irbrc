require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

require 'rubygems'
begin
  # load wirble
  require 'wirble'

  # start wirble (with color)
  Wirble.init({:skip_history => true})
  Wirble.colorize
rescue LoadError => err
  warn "Couldn't load Wirble: #{err}"
end
require 'pp'

if defined? Rails && Rails.env
  require 'logger'
  logger = Logger.new(STDOUT)
  ActiveRecord::Base.logger = logger
  ActiveResource::Base.logger = logger
end

if ENV['RAILS_ENV']
  require 'logger'
  Object.const_set('RAILS_DEFAULT_LOGGER', Logger.new(STDOUT)) # Rails 2
end

require 'irb/completion'

# Prompt behavior
IRB.conf[:USE_READLINE] = true # Adds readline functionality
#IRB.conf[:PROMPT_MODE] = :SIMPLE

