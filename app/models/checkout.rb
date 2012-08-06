class Checkout < ActiveRecord::Base

  def scan (item)
    #does nothing yet
  end

  def total
    return 2.00
  end
end
