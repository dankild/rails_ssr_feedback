require "rails_helper"

describe "Feedback CRUD >", type: :feature do
    it "allows user to access feedback creation page" do
        visit '/'
        click_on 'Send new feedback'

        expect(page).to have_content('Create feedback:')
    end
    
    it "creates new feedback through form" do
        visit '/new'
        fill_in 'Your name', with: 'Dan'
        fill_in 'Your e-mail', with: 'dan@mail.com'
        fill_in 'Your feedback', with: 'Make tests!'
        click_button 'Send'
        visit '/'

        expect(page).to have_content('Dan')
        expect(page).to have_content('dan@mail.com')
        expect(page).to have_content('Make tests!')
    end

    it "creates new feedback using factory bot" do
        feedback = create(:feedback)

        visit '/'

        expect(page).to have_content(feedback.name)
        expect(page).to have_content(feedback.email)
        expect(page).to have_content(feedback.body)
    end

    it "deletes feedback" do
        feedback = create(:feedback)

        visit '/'
        click_on 'Delete'
        
        expect(page).to have_selector('.card', count: 0)
        expect(page).not_to have_content(feedback.name)
        expect(page).not_to have_content(feedback.email)
        expect(page).not_to have_content(feedback.body)
    end
end