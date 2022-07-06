OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '844964808549-m2mmpjv3c6cnsll50eraplcgvsqjbcjf.apps.googleusercontent.com', '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', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end