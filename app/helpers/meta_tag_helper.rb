module MetaTagHelper
  def default_meta_tags
    {
      site: '横国フリマ',
      title: '',
      reverse: true,
      description: '横浜国立大学の学生のためのフリマ、サービス、サークル紹介アプリです。手数料無料は無料です。横国生だけが使っているので安心して使えます',
      keywords: 'YNU、横国フリマ、横浜国立大学、横国、横国アプリ、横浜国立大学サークル、横国サークル、横国フリマ、横浜国立大学フリマ ',
      separator: '|',
      noindex: !Rails.env.production?,
      canonical: request.original_url,
      charset: 'UTF-8',
      og: {
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        site_name: '横国フリマ',
        locale: 'ja_JP'
      },
      twitter: {
        site: '@02P2YpFj7JlGIeO',
        card: 'summary'
      }
    }
  end
end
