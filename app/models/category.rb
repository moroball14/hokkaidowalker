class Category < ActiveHash::Base
  self.data = [
      {id: 1, name: 'グルメ'}, {id: 2, name: 'お祭り'}, {id: 3, name: '花火'},
      {id: 4, name: 'イルミネーション'}, {id: 5, name: 'よさこい'},{id: 6, name: 'その他'}
  ]
end