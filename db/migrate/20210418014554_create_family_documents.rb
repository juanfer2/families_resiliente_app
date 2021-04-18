class CreateFamilyDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :family_documents do |t|
      t.references :professional, null: false, foreign_key: true
      t.string :code

      t.timestamps
    end
  end
end
