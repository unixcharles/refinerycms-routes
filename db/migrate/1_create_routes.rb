class CreateRoutes < ActiveRecord::Migration

  def self.up
    create_table :routes do |t|
      t.string :url
      t.string :locale
      t.boolean :redirect, :default => false
      t.integer :target_id
      t.string :target_type

      t.timestamps
    end

    add_index :routes, :url
    add_index :routes, [:target_id, :target_type]

    load(Rails.root.join('db', 'seeds', 'routes.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "refinerycms_routes"})

    drop_table :routes
  end

end
