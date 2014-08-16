CarrierWave.configure do |config|
  config.fog_credentials = {
    # Configuration for Amazon S3 should be made available through an Environment variable.
    # For local installations, export the env variable through the shell OR
    # if using Passenger, set an Apache environment variable.
    #
    # In Heroku, follow http://devcenter.heroku.com/articles/config-vars

    # Configuration for Amazon S3
    :provider              => 'AWS',
    :aws_access_key_id     => ENV["S3_KEY"],
    :aws_secret_access_key => ENV["S3_SECRET"],
    :region                => ENV["S3_REGION"]
  }
  
  # Choose what kind of storage to use for this uploader:
  if Rails.env.production?
    config.storage = :fog
  else
    config.storage = :file
  end
  
  config.cache_dir = "#{Rails.root}/tmp/uploads" # To let CarrierWave work on heroku
  config.fog_directory    = ENV["S3_BUCKET_NAME"]
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end