# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_simple-financial-control_session',
  :secret      => '6e9f6ccf6b8974fee42bbc8ff1a849da3dbe196d12a1384a83e929ef6b1da3f4003dbacffc48cdc00fcb02919ecfe1fcf3dc0b17dbf912ba3e658918d0df95fb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
