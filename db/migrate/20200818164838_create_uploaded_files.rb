class CreateUploadedFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :uploaded_files do |t|
      t.belongs_to :project, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
