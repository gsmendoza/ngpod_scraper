module NgpodScraper
  class Photo < Valuable
    has_value :file
    has_value :path_format
    has_value :url
    has_value :wallpaper_height
    has_value :wallpaper_width
    has_value :wallpaper_path_format

    def exists?
      Pow(path).exists?
    end

    def path
      return @path if defined?(@path)

      date = file.mtime
      year = date.year
      month = date.month
      day = date.day
      hour = date.hour
      name = Pow(file.path).name

      path_format_in_a_string = %Q{"#{path_format}"}
      @path = Pow(eval(path_format_in_a_string)).to_s
    end
  end
end
