module Header

  def open_menu
    page.find[:css, "a[id='mobile-nav-link']"].click
  end

end