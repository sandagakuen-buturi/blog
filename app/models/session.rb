class Session < ApiApplicationController
  scope :active, -> { where("expire_at > ?", Time.current) }

  class << self
    def find_active_by_key(key)
      Rails.cache.fetch("session:#{key}", expires_in: 1.week) do
        active.find_by(key: key)
      end
    end
  end
end
