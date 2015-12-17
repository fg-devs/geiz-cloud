# Clean Database (Only dev)
if Rails.env.development?

  DatabaseCleaner.clean_with :truncation

end