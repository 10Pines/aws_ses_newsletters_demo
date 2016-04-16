class VerySimpleNewslettersSender < AwsSesNewsletters::NewslettersSender
  VALID_ARGS = {from: 'fzuppa@esteticia.com',
          subject: 'Simple Newsletter',
          html_body: '<p>This is a very simple newsletter</p>'}

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
end