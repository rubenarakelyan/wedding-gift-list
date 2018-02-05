class GiftListController < ApplicationController
  def index
    @gifts = Gift.all.order(:created_at)
  end
end
