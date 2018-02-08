# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ENV['RECAPTCHA_PUBLIC_KEY']  = '6LcgQUUUAAAAABpG33pj_uqyAD2FUvrmypuRqH-o'
ENV['RECAPTCHA_PRIVATE_KEY'] = '6LcgQUUUAAAAAImXx8jbz-Jvl2u8UIlr0D-4qMu5'