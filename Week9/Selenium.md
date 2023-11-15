## Designing and Implementing Automated Tests with Selenium (Python)

#### Prerequisites:
a. Install Python
b. Install Selenium WebDriver for Python
c. Download the appropriate WebDriver (e.g., ChromeDriver) and add it to your system’s PATH

**Test Scenario:** Verify that tasks can be added, marked as completed, and deleted in the application to be tested.
1. Create a new Python file named `test_todo_list_selenium.py`.
2. Implement the test cases using Selenium:

```python
from selenium import webdriver
import time

# Initialize the WebDriver (using Chrome in this example)
driver = webdriver.Chrome()

# Open the ToDo list application
driver.get("https://exampletodolistapp.com")

# Test Case 1: Add a task
task_input = driver.find_element_by_id("new-task")
add_button = driver.find_element_by_id("add-button")

task_input.send_keys("Buy groceries")
add_button.click()

# Verify that the task has been added to the list
task_list = driver.find_element_by_id("task-list")
assert "Buy groceries" in task_list.text

# Test Case 2: Mark task as completed
complete_checkbox = driver.find_element_by_xpath("//span[text()='Buy groceries']/preceding-sibling::input[@type='checkbox']")
complete_checkbox.click()

# Verify that the task is marked as completed
assert "completed" in complete_checkbox.get_attribute("class")

# Test Case 3: Delete the task
delete_button = driver.find_element_by_xpath("//span[text()='Buy groceries']/following-sibling::button")
delete_button.click()

# Verify that the task has been removed from the list
assert "Buy groceries" not in task_list.text

# Close the browser
driver.quit()
```

3. Run the test using python test_todo_list_selenium.py.

#### References
1. [DevOps Zero to Hero — Day 19: Test Automation!!](https://medium.com/@navya.cloudops/devops-zero-to-hero-day-19-test-automation-992533856c0a)
