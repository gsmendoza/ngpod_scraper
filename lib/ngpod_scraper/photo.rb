module NgpodScraper
  class Photo < Valuable
    has_value :file
    has_value :path_format
    has_value :url
    has_value :wallpaper_background_color
    has_value :wallpaper_height
    has_value :wallpaper_width
    has_value :wallpaper_path_format

    def exists?
      Pow(path).exists?
    end

    def image
      @image ||= Magick::ImageList.new(path)
    end

    def path
      return @path if defined?(@path)
      path_format_in_a_string = %Q{"#{path_format}"}
      @path = Pow(eval(path_format_in_a_string)).to_s
    end

    def save
      Pow(path).create "w" do |f|
        f.write file.read
      end
    end

    def save_wallpaper
      Pow(wallpaper_path).parent.create
      wallpaper.write(wallpaper_path)
    end

    def wallpaper
      scale = wallpaper_scale
      resized_image = image.resize(scale * image.columns, scale * image.rows)

      background_color = wallpaper_background_color
      background = Magick::Image.new(wallpaper_width, wallpaper_height){
        self.background_color = background_color
      }

      background.composite(resized_image,
        (wallpaper_width - resized_image.columns)/2,
        (wallpaper_height - resized_image.rows)/2,
        Magick::OverCompositeOp)
    end

    def wallpaper_path
      return @wallpaper_path if defined?(@wallpaper_path)
      wallpaper_path_format_in_a_string = %Q{"#{wallpaper_path_format}"}
      @wallpaper_path = Pow(eval(wallpaper_path_format_in_a_string)).to_s
    end

    def wallpaper_scale
      [wallpaper_height.to_f/image.rows, wallpaper_width.to_f/image.columns, 1].min
    end

    private

      def day
        time.strftime('%d')
      end

      def hour
        time.strftime('%H')
      end

      def month
        time.strftime('%m')
      end

      def name
        Pow(url).name
      end

      def time
        Time.now
      end

      def year
        time.strftime('%Y')
      end
  end
end
