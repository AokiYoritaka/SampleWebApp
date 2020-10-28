module ApplicationHelper
  def default_meta_tags
    {
      title:       "School Review",
      description: "フィリピン／オーストラリアの語学学校レビューアプリ",
      keywords:    "フィリピン,オーストラリア,語学学校, 留学エージェント, Ruby, Rails",
      icon: image_url("/images/favicon.ico"), # favicon
      noindex: ! Rails.env.production?, # production環境以外はnoindex  
      charset: "UTF-8",
      # OGPの設定
      og: {
        title: "School Review",
        type: "website",
        url: request.original_url,
        image: image_url("/images/slide8.png"),
        site_name: "School Review",
        description: "フィリピン／オーストラリアの語学学校レビューアプリ",
        locale: "ja_JP"
      } 
    }
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

end
