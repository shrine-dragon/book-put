class Genre < ActiveHash::Base
  self.data = [
    { id:  0, name: '--' },
    { id:  1, name: 'ファンタジー' }, { id: 2, name: 'SF' },
    { id:  3, name: 'アドベンチャー' }, { id: 4, name: 'ヒーロー' },
    { id:  5, name: 'バトル' }, { id: 6, name: 'メルヘン' },
    { id:  7, name: 'ラブストーリー' }, { id: 8, name: 'ミステリー' },
    { id:  9, name: 'サスペンス' },    { id: 10, name: 'ホラー' },
    { id: 11, name: 'コメディー' },    { id: 12, name: 'ヘルス' },
    { id: 13, name: 'グルメ' },       { id: 14, name: 'ビジネス' },
    { id: 15, name: 'マネー' },       { id: 16, name: 'スクール' },
    { id: 17, name: 'スポーツ' }, { id: 18, name: 'ダーク' },
    { id: 19, name: 'オーバーキル' }, { id: 20, name: 'クライム' },
    { id: 21, name: '歴史' },         { id: 22, name: 'スローライフ' },
    { id: 23, name: '転生' },         { id: 24, name: 'その他' }
  ]
  include ActiveHash::Associations
  
  has_many :questionnaires
  has_many :books
end
