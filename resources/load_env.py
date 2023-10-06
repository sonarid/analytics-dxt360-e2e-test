from dotenv import load_dotenv
import os

load_dotenv()

# These variables can be loaded directly to the robot framework file.
# Put "Variable | load_env.py" in the settings of the robot/resource file to use the variables

email_user = os.environ['EMAIL']
password_user = os.environ['PASSWORD']

email_cx = os.environ['CXMAIL']
password_cx = os.environ['CXPASSWORD']


