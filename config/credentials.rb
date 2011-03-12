credentials = File.expand_path('../credentials.yml', __FILE__)
if File.exists?(credentials)
  config = YAML.load_file(credentials)
  config.fetch(Rails.env, {}).each do |key, value|
    ENV[key.upcase] = value.to_s
  end
end
