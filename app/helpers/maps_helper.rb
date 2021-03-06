module MapsHelper
  # ページごとの完全なタイトルを返します。
  def full_title(page_title = '')
    base_title = "Let's go travel"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
