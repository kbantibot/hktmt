class Post < ApplicationRecord
resourcify
belongs_to :user
    
has_many :ttmakings,:dependent => :destroy
has_many :calculators,:dependent => :destroy
has_many :plvals, :dependent => :destroy
has_many :calras, :dependent => :destroy

end
