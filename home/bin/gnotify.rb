#!/usr/bin/env ruby

require 'growl_notify'

GrowlNotify.config do |config|
   config.notifications = ["New mail"]
   config.default_notifications = ["New mail"]
   config.application_name = "mutt" #this shows up in the growl applications list in systems settings
end
while a = gets
  GrowlNotify.moderate(:title => 'New Mail', :description => a)
end

