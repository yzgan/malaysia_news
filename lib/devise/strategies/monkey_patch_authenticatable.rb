# monkey patch Devise::Strategies::Authenticatable
# to modify custom scope params for sign in api endpoint.

# {
#   user: {
#     email: 'user.example.com',
#     password: 'password'
#   }
# }

module Devise
  module Strategies
    module MonkeyPatchAuthenticatable
      API_REGEX = /api_v\d_/

      def params_auth_hash
        return super unless scope.match?(API_REGEX)

        params[scope.to_s.gsub(API_REGEX, '').to_sym]
      end
    end
  end
end
