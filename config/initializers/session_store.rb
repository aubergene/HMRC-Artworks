# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_hmrc_artworks_session',
  :secret      => 'f67d162370750343645ef7224bd9cf02fa52b991aec9d3e22dfdd0e962b919a76b0e0f08705d08d92c756c32af3c7697bbe6fc8092c626a8d9b901896476088c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
