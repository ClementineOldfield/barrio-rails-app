describe("Sign up & login using the UI", function() {
  before(function(){
    cy.app('clean')
    cy.app('seed')
  });
  
  var email = "test@test.com"
  var password = "123456"

  it("Sign Up succesfully, check if address errors are functioning and create address succesfully", function() {
    cy.visit("/users/signup")
    cy.get("input[name='user[first_name]'").type("Test")
    cy.get("input[name='user[last_name]'").type("McTest")
    cy.get("input[name='user[email]']").type(email)
    cy.get("input[name='user[password]'").type(password)
    cy.get("input[name='user[password_confirmation]'").type(password)
    cy.get("input[type='submit'").click()
    cy.location("pathname").should("eq", "/address/new")
    cy.get('.address-error').should('not.exist')
    cy.get("input[type='submit'").click()
    cy.get('.address-error').should('exist')
    cy.get("input[name='address[street_1]']").type("Kahuna Burger")
    cy.get("input[name='address[street_2]']").type("5/359 Illawarra Rd")
    cy.get("input[name='address[suburb]']").type("Marrickville")
    cy.get("select[name='address[state]']").select("NSW")
    cy.get("input[name='address[postcode]']").type("2204")
    cy.get("input[type='submit']").click()
    cy.contains("Edit your profile").should('exist')
  });

  it("Login succesfully", function() {
    cy.visit("/login")
    cy.get("input[name='user[email]']").type(email)
    cy.get("input[name='user[password]'").type(password)
    cy.get("input[type='submit'").click()
    cy.location("pathname").should("eq", "/dashboard")
  });

});