class Route < ActiveRecord::Base

  acts_as_indexed :fields => [:url, :locale]

  validates :url, :presence => true, :uniqueness => true,
            :format => { :with => /(^[\da-zA-Z_-]+)/ }

  belongs_to :target, :polymorphic => true

end
