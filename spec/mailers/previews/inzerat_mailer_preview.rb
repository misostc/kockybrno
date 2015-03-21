# Preview all emails at http://localhost:3000/rails/mailers/inzerat_mailer
class InzeratMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/inzerat_mailer/cat_added
  def cat_added
    InzeratMailer.cat_added(Tomcat.new)
  end

end
