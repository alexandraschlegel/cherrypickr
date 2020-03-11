class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end
#additions for faq and about pages
  def about
  end

  def faq
  end
end
