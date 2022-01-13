class CreateAnniversaries < ActiveRecord::Migration[5.2]
  def change
    create_table :anniversaries do |t|
      t.string :title
      t.string :anniv_image_id
      t.boolean :disp_flg
      t.datetime :start
      t.datetime :end
      t.string :allDay

      t.timestamps
    end
  end
end
