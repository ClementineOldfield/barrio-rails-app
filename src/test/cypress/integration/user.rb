describe("User edit & delete", function () {
  beforeEach(function(){
    cy.app('clean')
    cy.app('seed')
    cy.visit("/login")
    cy.get("input[name='user[email]']").type("test@email.com")
    cy.get("input[name='user[password]'").type("123456")
    cy.get("input[type='submit']").click()
    cy.location("pathname").should("eq", "/dashboard")

  });
  
  it("Edit user bio", function() {
    cy.visit("/users/11/edit")
    cy.get("textarea[name='user[bio]']").type("{selectall}Lorem Ipsum dolor sit amet. Test, this is a test. I repeat. This is a test. Pizza.")
    cy.get("input[type='submit'").click()
    cy.contains('This is a test. Pizza.').should('exist')
  });

  it("Edit user account details", function() {
    cy.visit("/edit")
    cy.get("input[name='user[first_name]'").type("{selectall}Test")
    cy.get("input[name='user[last_name]'").type("{selectall}McTest")
    cy.get("input[name='user[email]']").type("{selectall}new@email.com")
    cy.get("input[name='user[current_password]'").type("123456")
    cy.get("input[value='Update']").click()
    cy.get("input[value='Test']").should("exist")
    cy.get("input[value='McTest']").should("exist")
    cy.get("input[value='new@email.com']").should("exist")
  });

  it("Delete user", function() {
    cy.visit("/edit")
    cy.get("input[value='Cancel my account']").click()
    cy.location("pathname").should("eq", "/")
    cy.contains("Bye! Your account has been successfully cancelled.").should("exist")
  });

});