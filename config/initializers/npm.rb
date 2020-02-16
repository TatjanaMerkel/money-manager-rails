# Rails (or Bundler) prevents you from starting itself when you have gems
# that are not installed yet. To emulate that behavior for npm packages, do this
system 'npm install' if Rails.env.development? || Rails.env.test?