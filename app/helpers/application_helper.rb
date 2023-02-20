module ApplicationHelper
  def customer_active(customer)
    if customer.is_active?
      "<span style='color:aqua'>#{customer.active_text}</span>"
    else
      "#{customer.active_text}"
    end
  end
end
