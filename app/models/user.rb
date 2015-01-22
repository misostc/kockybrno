class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_taggable_on :species

  has_many :kittens
  has_many :tomcats

  def nice_name
    out = "";
    if prefix_title then out << prefix_title + " " end
    out << "#{first_name} #{last_name}"
    if suffix_title then out << ", #{suffix_title}" end
    out
  end
end
