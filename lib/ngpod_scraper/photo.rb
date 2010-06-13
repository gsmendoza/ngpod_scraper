module NgpodScraper
  class Photo < Valuable
    has_value :file
    has_value :path_format
    has_value :url
    has_value :wallpaper_height
    has_value :wallpaper_width
    has_value :wallpaper_path_format
  end
end
