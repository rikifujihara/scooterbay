class ChangePostcodeToStringInAddresses < ActiveRecord::Migration[6.1]
  def change
    change_column :addresses, :postcode, :string
  end
end
