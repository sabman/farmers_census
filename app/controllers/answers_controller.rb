# FIXME: unchecking all options doesn't send back any params

class AnswersController < ApplicationController
  before_filter :verify_admin
end
