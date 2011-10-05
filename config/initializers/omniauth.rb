require 'openid/store/filesystem'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "237704172943849", "08b5035de2dd95a1d35de860d47e5b39"
  provider :twitter, "1hO9NKyjgjW7Zc12KUIcvA", "ixfHP8V4f8Lujw1BzjXgCrsBg301mXoUUl9tZsLypI"
end

