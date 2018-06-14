class User < ApplicationRecord
  def self.find_or_create_from_auth(auth)
    provider = auth[:provider]
    uid = auth[:uid]
    nickname = auth[:info][:nickname]
    image_url = auth[:info][:image]
    token = auth[:credentials][:token]
    secret = auth[:credentials][:secret]

    user = find_or_create_by(provider: provider, uid: uid) do |u|
      u.nickname = nickname
      u.image_url = image_url
      u.tw_token = token
      u.tw_token_secret = secret
    end

    if user.tw_token != token || user.tw_token_secret != secret
      user.update(tw_token: token, tw_token_secret: secret)
    end

    user
  end
end
