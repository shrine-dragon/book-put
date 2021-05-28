class ReadingMedia < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '紙媒体' },
    { id: 2, name: '電子書籍' },
    { id: 3, name: 'その他' }
  ]
  include ActiveHash::Associations
  
  has_many :questionnaires
end
