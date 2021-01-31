class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    drop_table :teams
    create_table :teams do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
