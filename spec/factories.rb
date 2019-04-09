FactoryBot.define do
  factory :url do
    original_url { 'https://google.com' }
    slug { Digest::SHA256.hexdigest(original_url)[0...6] }
  end
end