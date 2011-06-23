class CartController < ApplicationController
  skip_before_filter :authorize, :only => :create
end
