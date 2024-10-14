class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones

  accepts_nested_attributes_for :phones

  # def author
  #   "Cristiano Souza"
  # end

  # def kind_description
  #   self.kind.description
  # end

  # def as_json(options={})
  #   super(
  #     root: true,
  #     methods: [:author, :kind_description],
  #     include: { kind: { only: :description } }
  #   )
  # end

  def as_json(options={})
    birthdate_locale = super(options)
    birthdate_locale[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
    birthdate_locale
  end
end