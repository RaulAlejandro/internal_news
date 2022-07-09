require 'rails_helper'
require_relative '../support/new_post_form'
require_relative '../support/omni_auth_test'

RSpec.feature "Posts", type: :feature, js: true do
    let(:new_post_form) { NewPostForm.new }
    let(:omni_auth_test) { OmniAuthTest.new }

    before do
      visit(sign_in_path)
      omni_auth_test.valid_google_login
      click_link "Conectate usando Google"
    end 

    it 'Visit index posts' do
      #visit(posts_path)
      page.save_screenshot('screenshot-index.png')
      expect(page).to have_content("Noticias Internas")
    end

    it 'Creating new Post' do
      click_link "Nueva Noticia"
      page.save_screenshot('screenshot-form.png')

      expect(page).to have_content("Publicar Noticia")

      fill_in('Titular', with: Faker::Lorem.word)
      fill_in('Bajada', with: Faker::Lorem.paragraph)
      #fill_in('Imagen', with: Faker::File.file_name(dir: "#{Rails.root}/tmp", ext: 'jpg'), visible: false)
      #fill_in('Contenido', with: Faker::Lorem.paragraph, visible: false)

      click_button "Publicar"
    end

#    it 'Creates a Post - Page Object Pattern' do
#
#      click_link "Nueva Noticia"
#      page.save_screenshot('screenshot-form.png')
#      expect(page).to have_content("Publicación")
#
#
#      new_post_form.visit_page.fill_in_with(
#        title: Faker::Lorem.word,
#        summary: Faker::Lorem.paragraph,
#        imagen: Faker::File.file_name(dir: "#{Rails.root}/tmp", ext: 'jpg')
#        #content: Faker::Lorem.paragraph(sentence_count: 12)
#      ).submit
       #expect(page).to have_content('Noticia Creada Correctamente')
#
#    end

end
