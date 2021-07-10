class Period < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 3, name: '3ヶ月' },
    { id: 6, name: '6ヶ月' },
    { id: 12, name: '12ヶ月' }
  ]

  include ActiveHash::Associations
  has_many :targets
end