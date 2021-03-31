class BookCategory < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '漫画' },
    { id: 2, name: '小説' },
    { id: 3, name: '雑誌' },
    { id: 0, name: 'ビジネス書' },
    { id: 0, name: '自己啓発本' },
    { id: 0, name: '文学' },
    { id: 0, name: '歴史書' },
    { id: 0, name: '絵本' },
    { id: 0, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :questionnaires
end