class ApplicationController < ActionController::Base

  include DeviseWhitelist
  include UserChecker

end
