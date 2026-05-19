class Session < ApiApplicationController
  scope :active, -> { where("expire_at > ?", Time.current) }

  class << self
  end
end
