describe("Purchasing items", function() {
  beforeEach(function(){
    cy.app('clean')
    cy.app('seed')
    cy.visit("/login")
    cy.get("input[name='user[email]']").type("test@email.com")
    cy.get("input[name='user[password]'").type("123456")
    cy.get("input[type='submit']").click()
    cy.location("pathname").should("eq", "/dashboard")
  });

  it("Confirmation to buy a single product", function() {
    cy.visit("/listings/4")
    cy.contains("Buy Now").click()
    cy.location("pathname").should("eq", "/listing/4/confirmation")
    cy.contains("Quantity: 1").should("exist")
  });

  it("Confirmation to buy multiple products", function() {
    cy.visit("/listings/4")
    cy.get("input[name='quantity']").type("{selectall}3")
    cy.contains("Buy Now").click()
    cy.location("pathname").should("eq", "/listing/4/confirmation")
    cy.contains("Quantity: 3").should("exist")
  });
});