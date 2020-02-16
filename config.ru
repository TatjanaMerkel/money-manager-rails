# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

class RootSiteAuth < Rack::Auth::Basic
  def call(env)
    request = Rack::Request.new(env)

    if request.path.to_s.start_with?('/admin')
      super
    else
      @app.call(env)
    end
  end
end

use RootSiteAuth, "Restricted Area" do |username, password|
  [username, password] == ['admin', 'admin']
end

run Rails.application
