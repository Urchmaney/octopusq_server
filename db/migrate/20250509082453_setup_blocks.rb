class SetupBlocks < ActiveRecord::Migration[8.0]
  def create_timestamped_table(*args, **kwargs, &block)
    create_table(*args, **kwargs) do |t|
      block.call(t)

      t.timestamps
    end
  end

  def change
    create_timestamped_table :workspaces do |t|
      t.string :name
      t.belongs_to :user, null: false, foreign_key: true
    end

    create_timestamped_table :blocks do |t|
      t.string :content
      t.references :wall
      t.references :presenting_wall
      t.references :cement
      t.references :page
      t.references :workspace, null: false
    end

    create_timestamped_table :walls do |t|
      t.references :workspace, null: false
    end

    create_timestamped_table :cements do |t|
      t.string :question
      t.references :workspace, null: false
      t.references :root_workspace
    end
  end
end
