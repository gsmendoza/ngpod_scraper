README
========================================================================

Download the photo of the day from the National Geographic website
and save it as a desktop wallpaper.

Installation
------------------------------------------------------------------------

    gem install ngpod-scraper

Requirements
------------------------------------------------------------------------

* nokogiri
* pow
* rmagick
* valuable

Usage
------------------------------------------------------------------------

    ngpod_scaper path/to/config.yml

Sample config.yml
------------------------------------------------------------------------

    url: http://photography.nationalgeographic.com/photography/photo-of-the-day
    show_logs: true
    photo:
      path_format:                '/home/gsmendoza/Pictures/national-geographic/#{year}-#{month}/#{name}'
      wallpaper_path_format:      '/home/gsmendoza/Pictures/national-geographic/photo-of-the-day.jpg'
      wallpaper_width:            1280
      wallpaper_height:           800
      wallpaper_background_color: black

`path_format` and `wallpaper_path_format` are evaluated as strings.
For convenience, the following values are provided:

* time, year, month, day, hour - based on `Time.now`
* name - the filename of the photo

Displaying the photos as your screensaver
------------------------------------------------------------------------

In Ubuntu, you'll need to do [this](http://cro.alienpants.com/index.php/2008/01/04/customising-the-pictures-folder-screensaver-in-ubuntu-gutsy/).
