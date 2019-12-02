feature "Hello world" do
  scenario "Visits the home page and shows 'Hello, world'" do
    visit "/"
    expect(page).to have_content "Hello, world"
  end
end