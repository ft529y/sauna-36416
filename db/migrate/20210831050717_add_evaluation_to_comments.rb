class AddEvaluationToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :evaluation, :float
  end
end
