class Work < ActiveRecord::Base
  attr_accessible :description, :name, :post, :avatar, :startdate, :stopdate, :personA, :personB, :personC, :personD, :personE, :personF, :department, :details, :teacher, :assistant
  has_attached_file :avatar, :styles => { :medium => "1920x900>" }, :default_url => "/images/:style/missing.png"
end
