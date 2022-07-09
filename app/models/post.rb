class Post < ApplicationRecord

    #Relationship
    belongs_to :user
    has_one_attached :image

    before_validation :load_uuid

    # Validations
    validate  :acceptable_image
    validates :title,
              :content,
              :summary,
              :user,
              presence: true

    ##############

    def self.search(author, start_date, end_date, order_by)
        query = Post.all
        if author.present?
            query = query.joins(:user)
                         .where('users.name ILIKE ?', "%#{author}%")
        end
        if start_date.present? && start_date.present?
            query = query.where("posts.created_at BETWEEN ? AND ?", start_date, end_date )
        end
        if order_by.present?
            unless order_by == '0'
                query = query.joins(:user).order('users.name DESC')
            else
                query = query.joins(:user).order('users.name ASC')
            end
        end
        query
    end

    private

    def  load_uuid
       self.uuid = SecureRandom.uuid
    end

    def acceptable_image
	  return unless image.attached?

	  unless image.byte_size <= 1.megabyte
	    errors.add(:image, "is too big")
	  end

	  acceptable_types = ["image/jpeg", "image/png"]
	  unless acceptable_types.include?(image.content_type)
	    errors.add(:image, "must be a JPEG or PNG")
	  end
	end

end
