class GiftListController < ApplicationController
  def index
    @gifts = Gift.all.order(:updated_at)
  end
end
