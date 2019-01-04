el_config = {
  host: 'http://localhost:9200/',
  transport_options: {
    request: { timeout: 5 }
  }
}

Elasticsearch::Model.client = Elasticsearch::Client.new(el_config)
