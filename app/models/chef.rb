class Chef < ApplicationRecord
    before_save {self.email = email.downcase}
    validates :chefname, presence: true, length: {maximum: 30}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum: 255},
                      format: {with: VALID_EMAIL_REGEX},
                      uniqueness: {case_sensitive: false}
    has_many :recipes, dependent: :destroy #when the chef was deleted, his/her recipe(s) would be deleted as well
    has_secure_password
    validates :password, presence: true, length: {minimum: 5}, allow_nil: true
    default_scope -> {order(updated_at: :desc)} #lastest chef shows first
    has_many :comments, dependent: :destroy #when the chef was deleted, his/her comment(s) would be deleted as well
    has_many :messages, dependent: :destroy
    has_many :likes, dependent: :destroy
end