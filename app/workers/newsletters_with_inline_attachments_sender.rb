require 'aws_ses_newsletters/html_builder'

class NewslettersWithInlineAttachmentsSender < AwsSesNewsletters::NewslettersSender
  VALID_ARGS = {
      from: 'fzuppa@esteticia.com',
      subject: 'Newsletter with Inline Attachments',
      html_body: AwsSesNewsletters::HtmlBuilder.new(
          "#{::Rails.root}/app/views/newsletter_with_inline_attachments.html.erb",
          {promotions: [OpenStruct.new(name: '10% off this week')]}
      ).build
  }

  def create_newsletter
    @newsletter = AwsSesNewsletters::Newsletter.create(VALID_ARGS)
  end

  def build_newsletter
    @newsletter = AwsSesNewsletters::Newsletter.new(VALID_ARGS)
  end

  def get_recipients
    recipient = Recipient.new('fzuppa@10pines.com', 'Federico', 'Zuppa')
    yield recipient
  end

  def get_images
    images = {}
    images["logo10pines"] = File.read(Rails.root.join('public/mailresources/logo-fullcolor_150px.png'))
    images
  end
end