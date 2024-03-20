class Scraper < ApplicationRecord
  enum state: %i[
    opening
    processing
    completed
    failed
  ]

  class << self
    def publish!
      transaction do
        opening.lock.each do |scraper|
          scraper.update(state: :processing)
        end
      end
    end
  end
end
