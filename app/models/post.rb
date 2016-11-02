class Post < ActiveRecord::Base
  CATEGORY = ['Insurance', 'Certification','News']
  validates :category, inclusion: {
    in: CATEGORY,
    message: 'Must be relevant category'
  }
end
