# CheckWeb

I wrote this to obsessively check a website for changes, particularly whether there are any updates with a paper I submitted.  If the status has changed, an e-mail will be sent with the new status and a link to the website.

## Requires
This uses [RVM](http://beginrescueend.com/) and a .rvmrc file to ensure that ruby version 1.9.3 is used.

## Usage
First, run

    bundle

to install all of the required gems.  Then, update the ./lib/check_web.rb so that it grabs the part a page you want it to monitor.  Also **update the mailer options** so that it sends an e-mail to the correct address.  Next, edit ./config/schedule.rb to have it run at the frequency you want (this is for the [whenever](https://github.com/javan/whenever) gem).  Lastly, run

    whenever

to make sure the crontab looks right then

    whenever -w

to update the crontab.