class GiftListController < ApplicationController
  def index
    @gifts = Gift.all
  end
end
