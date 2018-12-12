# frozen_string_literal: true

# Class Application Controller
class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler
end
