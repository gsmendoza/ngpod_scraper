module NgpodScraper
  def self.client(path)
    config = YAML.load_file(path)
    Client.new(config)
  end
end
