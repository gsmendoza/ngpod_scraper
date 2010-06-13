module NgpodScraper
  class Client
    attr_reader :config

    def initialize(config)
      @config = symbolize_keys(config)
    end

    def get_photo
      PhotoPage.new(config[:url], config).photo
    end

    def log(message)
      if config[:show_logs]
        puts message
      end
    end

    def run
      photo = get_photo
      if photo.exists?
        log "Wasn't able to download the photo of the day. Maybe the photo has already been downloaded."
      else
        photo.save
        log "Downloaded #{photo.path}"
      end
      photo
    end

    private

      def symbolize_keys(hash)
        result = {}
        hash.each do |key, value|
          value = symbolize_keys(value) if value.is_a?(Hash)
          result[key.to_sym] = value
        end
        result
      end
  end
end
