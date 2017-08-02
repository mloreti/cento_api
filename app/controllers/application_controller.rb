class ApplicationController < ActionController::API
  include Knock::Authenticable
  # devise defines this, while knock is using `method_missing`
  undef_method :current_user
end
