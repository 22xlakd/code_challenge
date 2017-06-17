class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :thumbnail
      t.boolean :subscription_required, default: false

      t.timestamps null: false
    end
  end
end
