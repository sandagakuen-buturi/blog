class Session < ApiApplicationController
  scope :active, -> { where("expire_at > ?", Time.current) }

  class << self
    def find_active_by_key(key)
      active.find_by(key: key)
    end
  end
end
