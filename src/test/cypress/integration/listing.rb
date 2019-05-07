describe("Rails listing CRUD", function () {
  before(function(){
    cy.app('clean')
    cy.app('seed')
  });

  it("Login succesfully", function() {
    cy.visit("/login")
    cy.get("input[type='text']").first()
    cy.type(User.first)
    cy.get("input[name='password'")
    cy.type("test")
    cy.contains("Log in").click()
    cy.location("pathname").should("eq", "/dashboard")
  });

});