class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, :presence => true
  validates :last_name, :presence => true

  has_many :kittens
  has_many :tomcats

  def nice_name
    out = "";
    unless prefix_title.blank? then out << prefix_title + " " end
    out << "#{first_name} #{last_name}"
    unless prefix_title.blank? then out << ", #{suffix_title}" end
    out
  end
end
