require 'rails_helper'

RSpec.feature "LandingPages", type: :feature do
  context 'Going to website' do
     Steps 'It says Listing Apartments' do
       Given 'I am on the landing page' do
         visit '/'
       end # ends given
       Then 'I can see Listing Apartments' do
         expect(page).to have_content ("Listing Apartments")
       end # ends then
     end # ends steps
  end # ends context

  context 'I create a new apartment listing' do
    Steps 'I click a button to create a new apartment' do
      Given 'I am taken to a new page' do
        visit '/apartments/new'
      end # ends given
      Then 'I can fill in my information' do
        fill_in 'Street1', with: '12820 Via Del Toro'
        fill_in 'Street2', with: 'APT 2'
        fill_in 'City', with: 'Poway'
        fill_in 'Postalcode', with: '92064'
        fill_in 'State', with: 'CA'
        fill_in 'Country', with: 'USA'
        fill_in 'Ownerfullname', with: 'Sophie Merkley'
        select '00', from: 'apartment_time_4i'
        select '01', from: 'apartment_time_5i'
        fill_in 'Phonenumber', with: '858-386-3377'
      end # ends then
      Then 'I clcik the submit button' do
        click_button 'Create Apartment'
      end
      And 'I am taken to the show page' do
        expect(page).to have_content('12820 Via Del Toro')
      end # ends and
    end # ends steps
  end # ends contexts

















end # ends rspec
