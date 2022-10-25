describe("Home page", () => {

  it('renders homepage', () => {
    cy.visit('/')
  });

  it("before clicking add to cart total items is 0", () => {
    cy.get(".cart_test").should("include.text", " My Cart (0)");
  })
  it("after clicking add to cart total items is 1", () => {
    cy.get('.btn').click({force: true} )
    cy.get(".cart_test").should("include.text", " My Cart (1)");
  })

})