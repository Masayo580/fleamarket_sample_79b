class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :images, dependent: :destroy
  belongs_to :category

  belongs_to_active_hash :brand
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postege_payer
  belongs_to_active_hash :postage_tyep
  belongs_to_active_hash :preparation_day


  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true
  
  accepts_nested_attributes_for :images, allow_destroy: true, update_only: true

  validates :category_id, :item_condition_id, :postage_tyep_id, :preparation_day_id, :postege_payer_id, :images, presence: true
  validates :name,             presence: true, length: {maximum: 40 }
  validates :introduction,      presence: true, length: {maximum: 1000 }
  validates :price,            numericality: { only_integer:true, greater_than_or_equal_to:300, less_than: 99999999, message: '300以上9999999以下で入力してください'}

  enum trading_status: {
    "販売中": 0,
    "売り切れ": 1
  }

end
