class Search < ActiveRecord::Base
  belongs_to :searchable, polymorphic: true

  
end
