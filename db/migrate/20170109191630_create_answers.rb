class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.text :response
      t.belongs_to :question, null: false


      t.timestamps
    end
  end
end
