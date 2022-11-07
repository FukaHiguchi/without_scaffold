class CreateMyThreads < ActiveRecord::Migration[7.0]
  def change
    create_table :my_threads do |t|
      t.text :text
      t.timestamps
    end
  end
end
