class Genre < ActiveHash::Base
  self.data = [
    { id: 1,  name: '--' },
    { id: 2,  name: '文芸・小説' },
    { id: 3,  name: '社会・ビジネス' },
    { id: 4,  name: '旅行・地図' },
    { id: 5,  name: '趣味' },
    { id: 6,  name: '実用・教育' },
    { id: 7,  name: 'アート・教養・エンタメ' },
    { id: 8,  name: '語学・辞書' },
    { id: 9,  name: 'こども' },
    { id: 10, name: '雑誌' },
    { id: 11, name: 'コミック・ラノベ' },
    { id: 12, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :books
end
