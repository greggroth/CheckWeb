# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

set :output, "./cron_log.log"
job_type :ruby, 'cd :path && ruby :task :output'

every 30.minutes do
  ruby "./lib/check_web.rb"
end