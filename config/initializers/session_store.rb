# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rsonrails_reutilizacao_session',
  :secret      => '1466cfac751b78af19e21c2e08172966d70082468cb3690aa1c8e0d844d1f90a1ecf2e5fdb191f2fde270d9ae3ca3d3f4810ea7bc79ee5a1379a1ee495ea3db9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
