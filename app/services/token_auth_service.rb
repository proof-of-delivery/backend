class TokenAuthService
    AUTH_SECRET = Rails.application.secrets.secret_key_base

    def self.issue(payload,exp=48.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, auth_secret, 'HS256')
    end

    def self.decode(token)
      JWT.decode(token, auth_secret, true, algorithm: 'HS256').first
    end

    def self.auth_secret
      AUTH_SECRET
    end
end