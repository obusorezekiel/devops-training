## Designing and Implementing Automated Tests with Cypress (JavaScript)

#### Prerequisites:
a. Install Node.js
b. Install Cypress

**Test Scenario:** Verify that tasks can be added, marked as completed, and deleted in the application to be tested.
1. Create a new folder for the Cypress project and navigate into it.
2. Initialize a new Cypress project using the following command:

```bash
npx cypress open
```

3. After the Cypress application launches, you’ll find the cypress/integration folder.
4. Create a new file named `todo_list_cypress.spec.js`.
5. Implement the test cases using Cypress:

```javascript
describe('ToDo List Tests', () => {
  beforeEach(() => {
    cy.visit('https://exampletodolistapp.com');
  });

  it('Adds a task', () => {
    cy.get('#new-task').type('Buy groceries');
    cy.get('#add-button').click();
    cy.contains('Buy groceries').should('be.visible');
  });

  it('Marks a task as completed', () => {
    cy.get('#new-task').type('Buy groceries');
    cy.get('#add-button').click();
    cy.get('input[type="checkbox"]').check();
    cy.get('input[type="checkbox"]').should('be.checked');
  });

  it('Deletes a task', () => {
    cy.get('#new-task').type('Buy groceries');
    cy.get('#add-button').click();
    cy.get('button').click();
    cy.contains('Buy groceries').should('not.exist');
  });
});
```
6. Click on the test file (todo_list_cypress.spec.js) in the Cypress application to run the test.

Cypress will open a browser window, and you will see the automated tests executing. You can also view detailed logs, screenshots, and videos of the test execution in the Cypress application.

In this example project, we demonstrated how to design and implement automated tests for a ToDo list web application using both Selenium with Python and Cypress with JavaScript. Selenium offers flexibility across various programming languages and browsers, while Cypress provides a more streamlined and developer-friendly experience for modern web applications.

#### References
1. [DevOps Zero to Hero — Day 19: Test Automation!!](https://medium.com/@navya.cloudops/devops-zero-to-hero-day-19-test-automation-992533856c0a)
