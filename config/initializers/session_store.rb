#coding:utf-8
# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_dooxoo_new_session',
  :secret      => 'f77b66c9519776b8c7304cf0a15062c04fb7cb746c8beea61a4607e486e11545929e6742ed437f5febf4ec7ba41ab9fa21bcb286f7486b1b254aeb153e459ef5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
