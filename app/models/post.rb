class Post < ApplicationRecord
    belongs_to :user

    before_validation :load_uuid

    # Validations
    validates :title,
              :content,
              presence: {message: I18n.t('messages.not_blank')}

    private

    def  load_uuid
       self.uuid = SecureRandom.uuid
    end
end
