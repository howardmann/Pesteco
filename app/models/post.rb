class Post < ActiveRecord::Base
  CATEGORY = ['Insurance', 'Certification','Safety']
  validates :category, inclusion: {
    in: CATEGORY,
    message: 'Must be relevant category'
  }
end
