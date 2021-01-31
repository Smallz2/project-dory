class Updaterelationship < ActiveRecord::Migration[6.0]
  def change
    rename_column :teams, :team_lead, :lead
  end
end
