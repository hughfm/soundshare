class SessionsController < Clearance::SessionsController
  skip_after_action :verify_authorized
end
