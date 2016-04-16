namespace :newsletters do

  desc "Very simple newsletter"
  task very_simple: :environment do
    VerySimpleNewslettersSender.perform_async
  end

  desc "Newsletter with variable replacements"
  task with_variable_replacement: :environment do
    NewslettersWithVariableReplacementsSender.perform_async
  end

  desc "Newsletter with inline attachments"
  task with_inline_attachments: :environment do
    NewslettersWithInlineAttachmentsSender.perform_async
  end
end
