require "open-uri"
require "nokogiri"
require "pony"
require "CGI"

####  User updatable  ####
# update the next three lines to grab the element from the page you want to monitor
url = "https://authors.aps.org/cgi-bin/wvman?acc=LP12682&auth=Rothmeier"
status_filename = './lib/status'
current_status = Nokogiri::HTML(open(url)).xpath("//br/following-sibling::text()").first.to_html.gsub(/\n/, '')
##########################

File.new(status_filename, "w") unless File::exists?(status_filename)
last_status = IO.readlines(status_filename)

if current_status == last_status[0]
  puts "[#{Time.now}]   Nothing new"
else
  puts "[#{Time.now}]   New Status:  #{current_status}"
  Pony.mail(
    ##########  User Updatable   ###########
      to: 'greggroth@gmail.com', 
      from: 'greggroth@gmail.com', 
      subject: 'Your Paper Status Has Changed!', 
      body: "New Status!!   #{CGI.unescapeHTML(current_status)}\n#{url}",
      via: :sendmail)
    #########################################
  IO.write(status_filename, current_status)
end