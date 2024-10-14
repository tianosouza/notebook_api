class ChangeKindIdToOptionalInContacts < ActiveRecord::Migration[7.2]
  def change
    change_column_null :contacts, :kind_id, true
  end
end
