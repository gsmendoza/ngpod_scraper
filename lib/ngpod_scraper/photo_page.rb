module NgpodScraper
  class PhotoPage
    attr_reader :config, :url

    def initialize(url, config = {})
      @url = url
      @config = config
    end

    def photo
    end
  end
end
