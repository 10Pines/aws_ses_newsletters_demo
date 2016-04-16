require 'aws_ses_newsletters/html_builder'

class NewslettersWithVariableReplacementsSender < AwsSesNewsletters::NewslettersSender
  VALID_ARGS = {
      from: 'fzuppa@esteticia.com',
      subject: 'Newsletter with variable replacements',
      html_body: AwsSesNewsletters::HtmlBuilder.new(
          "#{::Rails.root}/app/views/newsletter_with_instance_variables.html.erb",
          {promotions: [OpenStruct.new(name: '10% off this week')]}
      ).build
  }

  def create_newsletter
    @newsletter = AwsSesNewsletters::Newsletter.create(VALID_ARGS)
  end

  def build_newsletter
    @newsletter = AwsSesNewsletters::Newsletter.new(VALID_ARGS)
  end

  def do_custom_replacements_for(mail, recipient)
    mail.html_part.body = mail.html_part.body.raw_source.gsub('recipient_email', recipient.email)
  end

  def get_recipients
    recipient = Recipient.new('fzuppa@10pines.com', 'Federico', 'Zuppa')
    yield recipient
  end
end