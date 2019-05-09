describe("Listing CRUD resource for user", function() {
  beforeEach(function(){
    cy.app('clean')
    cy.app('seed')
    cy.visit("/login")
    cy.get("input[name='user[email]']").type("test@email.com")
    cy.get("input[name='user[password]'").type("123456")
    cy.get("input[type='submit']").click()
    cy.location("pathname").should("eq", "/dashboard")
  });

  it("Create a listing", function() {
    cy.visit("listings/new")
    cy.get("input[name='listing[title]']").type("My Fun Listing")
    cy.get("textarea[name='listing[body]']").type("This is a listing I am creating")
    cy.get("input[name='listing[price]']").type("1000")
    cy.get("input[name='listing[quantity]']").type("5")
    cy.get("select[name='listing[category_id]']").select("Clothing")
    cy.get("input[value='Create']").click()
    cy.contains("My Fun Listing").should("exist")
  });

  it("View a listing", function() {
    cy.visit("/dashboard")
    cy.get(".listing-link").first().click()
    cy.contains("Buy Now").should("exist")
  });

  it("Edit/Update a listing", function() {
    cy.visit("listings/21/edit")
    cy.get("input[name='listing[title]']").type("{selectall}Pizza Pizza Pizza Pizza")
    cy.get("textarea[name='listing[body]']").type("{selectall}Pasta Pasta Pasta Pasta")
    cy.get("input[name='listing[price]']").type("{selectall}2200")
    cy.get("input[name='listing[quantity]']").type("{selectall}2")
    cy.get("select[name='listing[category_id]']").select("Music & Entertainment")
    cy.get("input[value='Update']").click()
    cy.location("pathname").should("eq", "/listings/21")
    cy.contains("Pizza Pizza").should("exist")
  });

  it("Archive a listing", function() {
    
    cy.visit("/listings/21/edit")
    cy.get(".archive-link").click()
    cy.contains("You have successfully deactivated your listing").should("exist")
  });

});