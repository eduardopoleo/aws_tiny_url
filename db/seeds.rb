original_url = 'https://google.com'

Url.create(
  original_url: 'https://google.com', 
  slug:  Digest::SHA256.hexdigest(original_url)[0...6]
)