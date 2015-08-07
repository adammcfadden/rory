p File.basename(__FILE__)

Sequel.migration do
  change do
    create_table :posts do
      primary_key :id
      column :name, :text, :null => false
    end
  end
end
