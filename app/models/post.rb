class Post < ActiveRecord::Base
  CATEGORY = ['Insurance', 'Certification','Safety', 'License']
  validates :category, inclusion: {
    in: CATEGORY,
    message: 'Must be relevant category'
  }
end
