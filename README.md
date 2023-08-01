# Automated Test using Robot Framework with SeleniumLibrary

This program is an automated test created using Robot Framework and SeleniumLibrary. The test is designed to automate the testing of https://dxt360.sonarplatform.com.

## Installation

To run this test, you need to have the following dependencies installed:

- Robot Framework
- SeleniumLibrary

You can install these dependencies using pip package installer. Open your terminal and run the following commands on this repository root directory:

```shell
pip install -r requirements.txt
```

Make sure you have Python and pip installed on your system before running the above commands.

## Test Execution

To execute the automated test, follow these steps:

1. Clone or download this repository to your local machine.
2. Open a terminal and navigate to the directory where the repository is located.
3. Make sure you have the required dependencies installed (Robot Framework and SeleniumLibrary).
4. Open `arguments.txt` in the root folder and replace the second line with the directory of test file. For example, if you want to run the Search page test:
```shell
tests\analytics\search.robot
```
5. Run the following command to execute the test. For best the best practice, run it in a Python Virtual Environment:

   ```shell
   robot -A arguments.txt
   ```

   Replace `test_suite.robot` with the name of the actual test suite file.

   The test execution will start, and you will see the progress and results in the terminal.

## Configuration

Before running the test, you may need to configure the test environment. Open the test suite file (e.g., `test_suite.robot`) and modify the test cases or keywords as required. You can update the test data, test steps, or any other relevant information.

Additionally, you may need to provide the URL, login credentials, or any other necessary details for accessing https://dxt360.sonarplatform.com. These details can be set as variables in the test suite file or imported from external resource files.

## Reporting

Once the test execution is complete, Robot Framework generates a detailed report and log file. The report provides an overview of the test execution, including test cases, status, and any failures. The log file contains detailed information about each step of the test.

You can find the generated report and log file in the results directory,named `results/report.html` and `results/log.html` along side with the screenshots, respectively. You can modify the generated report and log file directory by modifying the --output directory in `arguments.txt` to your desired directory.

## Contribution

If you find any issues or have suggestions for improvement, feel free to open an issue or submit a pull request on the repository. Your contributions are highly appreciated!

## License

This program is released under the [MIT License](LICENSE). Feel free to use, modify, and distribute it as per the terms of the license.