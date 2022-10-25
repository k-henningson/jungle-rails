describe("Home page", () => {

  it('renders homepage', () => {
    cy.visit('/')
  });

  it('should navigate to the products page',()=>{
    cy.get('.product_test').first().click()
  })

})