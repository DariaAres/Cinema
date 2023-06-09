# frozen_string_literal: true

class JsonWebToken
  SECRET_KEY = 'test key'
  # Rails.application.secrets.secret_key_base. to_s

  # exp = 24.hours.from_now
  def self.encode(payload)
    # payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY)
    # HashWithIndifferentAccess.new decoded
  end
end
