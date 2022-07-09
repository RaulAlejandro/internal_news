class NewPostForm
  include Capybara::DSL  # Capybara
  include FactoryBot::Syntax::Methods  # FactoryBot
  #include Warden::Test::Helpers  # Devise
  include Rails.application.routes.url_helpers  # Routes


  def visit_page
    visit(new_post_path)
    self
  end

  def fill_in_with(params = {})
    fill_in('Titular', with: params.fetch(:title, Faker::Lorem.word))
    fill_in('Bajada', with: params.fetch(:sumary, Faker::Lorem.paragraph))
    #fill_in('Imagen', with: params.fetch(:imagen, Faker::File.file_name(dir: "#{Rails.root}/tmp", ext: 'jpg')), visible: false)
    #fill_in('Content', with: params.fetch(:content, Faker::Lorem.paragraph(sentence_count: 12)))
    self
  end

  def submit
    click_button('Publicar')
  end
end