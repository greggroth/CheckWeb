require "open-uri"
require "nokogiri"
require "pony"
require "CGI"

url = "https://authors.aps.org/cgi-bin/wvman?acc=LP12682&auth=Rothmeier"
status_filename = './lib/status'
# current_status = Nokogiri::HTML(open(url)).xpath("//br/following-sibling::text()").first.to_html.gsub(/\n/, '')
current_status = "With editors\n\n".gsub(/\n/, '')

File.new(status_filename, "w") unless File::exists?(status_filename)
last_status = IO.readlines(status_filename)

if current_status == last_status[0]
  puts "Nothing new"
else
  puts "New Status:  #{current_status}"
  Pony.mail(
      to: 'greggroth@gmail.com', 
      from: 'greggroth@gmail.com', 
      subject: 'Your Paper Status Has Changed!', 
      body: "New Status!!   #{CGI.unescapeHTML(current_status)}\n#{url}",
      via: :sendmail)
  IO.write(status_filename, current_status)
end