class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :thumbnail
      t.string :subscription_required
      t.string :boolean

      t.timestamps null: false
    end
  end
end
