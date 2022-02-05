Refile.backends['store'] = Refile::Backend::FileSystem.new('public/uploads/')
# 画像アップロード先を変更　デフォルトはtmp/uploads/store

Refile.backends['cache'] = Refile::Backend::FileSystem.new('public/cache/')