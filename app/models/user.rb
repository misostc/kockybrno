class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :kittens
  has_many :tomcats

  def nice_name
    out = ''
    prefix_title.blank? || out << prefix_title + ' '
    out << "#{first_name} #{last_name}"
    suffix_title.blank? ||  out << ", #{suffix_title}"
    out
  end

  default_scope { order(:last_name, :first_name) }
end
