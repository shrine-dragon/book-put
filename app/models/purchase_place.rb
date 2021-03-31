class PurchasePlace < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '書店' },
    { id: 2, name: 'インターネット' },
    { id: 3, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :questionnaires
end
