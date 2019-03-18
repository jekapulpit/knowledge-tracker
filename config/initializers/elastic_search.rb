config = {
  host: 'http://elasticsearch:9200/',
  xpack: {
      security: { enabled: false }
  },
  user: 'elastic',
  password: 'changeme',
  transport_options: {
    request: { timeout: 5 }
  }
}

Elasticsearch::Model.client = Elasticsearch::Client.new(config)
