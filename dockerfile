FROM python:3



RUN python3 -m pip install robotframework robotframework-seleniumlibrary

# ENTRYPOINT  robot --outputdir /results login_tests/valid_login.robot