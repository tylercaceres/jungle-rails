module SalesHelper

  def active_sale?
    # Sale.where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current).any?
    # Sale.active.for_city('Toronto').above(5)any?
    Sale.active.any?
  end

end