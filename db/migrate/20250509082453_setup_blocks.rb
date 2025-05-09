class SetupBlocks < ActiveRecord::Migration[8.0]
  def create_timestamped_table(*args, **kwargs, &block)
    create_table(*args, **kwargs) do |t|
      block.call(t)

      t.timestamps
    end
  end

  def create_block_table
    create_timestamped_table :blocks do |t|
      t.string :content
      t.references :wall
      t.references :presenting_wall
      t.references :cement
      t.references :page
    end
  end

  def change
    create_block_table

    create_timestamped_table :walls

    create_timestamped_table :cements do |t|
      t.string :question
    end
  end
end
