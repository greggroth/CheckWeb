# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

set :output, "./cron_log.log"

every 1.minute do
  command "ruby ./lib/check_web.rb"
end