class InzeratMailer < ActionMailer::Base
  default from: "inzeraty@kockybrno.cz"

  def cat_added(cat)
    @cat = cat
    mail(to: ENV['MAILER_TO'], subject: "[Kockybrno.cz] Inzerat pridan")
  end
end
