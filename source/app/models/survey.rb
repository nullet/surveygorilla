class Survey < ActiveRecord::Base
    belongs_to :user, foreign_key: :author_id

end
