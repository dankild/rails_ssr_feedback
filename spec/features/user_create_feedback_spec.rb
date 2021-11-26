require "spec_helper"

RSpec.describe 'how user creates a feedback >' do
    it "come to creation page" do
        RSpec.visit '/new'
    end

    it "fill the form" do
        RSpec.fill_in 'Name', with: 'Katsu'
        RSpec.fill_in 'E-mail', with: 'katsu@nyawoo.xyz'
        RSpec.fill_in 'Feedback', with: 'Make better tests!'
    end
    
    it "submit the form" do
        click_button 'Send'
    end

    it "come to home page" do
        visit '/'
    end

    it "expects it on the home page" do
        expect(page).to have_content('Katsu')
        expect(page).to have_content('katsu@nyawoo.xyz')
        expect(page).to have_content('Make better tests!')
    end
end