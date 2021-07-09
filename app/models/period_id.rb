class PeriodId < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '3ヶ月' },
    { id: 3, name: '6ヶ月' }
    { id: 4, name: '12ヶ月' }
  ]

  include ActiveHash::Associations
  has_many :targets
end