class PasswordsController < Clearance::PasswordsController
  skip_after_action :verify_authorized
end
