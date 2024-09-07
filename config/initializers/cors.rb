allowed_host_origins = [
  'http://localhost', 'http://localhost:3000', 'http://localhost:3001', 'http://localhost:5173'     
]

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins allowed_host_origins

    resource '*',
             headers: :any,
             expose: %w[authorization],
             methods: %i[get post put patch delete options head]
  end
end
