class User < ApplicationRecord
  devise :database_authenticatable, :omniauthable, omniauth_providers: [:github]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.password = Devise.friendly_token[0, 20]
      user.nickname = auth.info.name
      user.git_profile_url = auth.info.urls.GitHub
      user.login_id = auth.extra.raw_info.login
      user.avatar_url = auth.extra.raw_info.avatar_url
      user.followers_url = auth.extra.raw_info.followers_url
      user.organizations_url = auth.extra.raw_info.organizations_url
      user.repos_url = auth.extra.raw_info.repos_url
      user.last_modified = auth.extra.raw_info.updated_at
    end
  end
end
