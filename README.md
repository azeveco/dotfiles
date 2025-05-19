# Dotfiles - Azeveco

Well, these are my dotfiles.

That's it. Nothing else.

...

What were you expecting?

## tmux and TPM

Always install TPM first:
<https://github.com/tmux-plugins/tpm>

## Troubleshooting GitHub Copilot Authentication on WSL

If you encounter issues with Copilot auth on WSL, try the following steps:

* Run the following curl command in your WSL terminal:

  ```bash
  curl -s https://github.com/login/device/code -X POST -d "client_id=Iv1.b507a08c87ecfe98&scope=read:user"
  ```

* This will return a response similar to:

  ```bash
  {
    "device_code": "DEVICE_CODE",
    "user_code": "USER_CODE",
    "verification_uri": "https://github.com/login/device",
    "expires_in": 900,
    "interval": 5
  }
  ```

Open a browser and complete the authentication flow by visiting the provided
verification_uri (in this case <https://github.com/login/device>) and entering the user_code.

* Run the following curl command to get the access token (replace YOUR_DEVICE_CODE with the actual device code you received in step 1):

  ```bash
  curl -s https://github.com/login/oauth/access_token -X POST -d "client_id=Iv1.b507a08c87ecfe98&device_code=YOUR_DEVICE_CODE&grant_type=urn:ietf:params:oauth:grant-type:device_code" | grep -o "access_token=[^&]*" | cut -d= -f2
  ```

This will return the token you need.

* Create a hosts.json file in the .config/github-copilot/ directory if it doesn't
  exist. Add the following content to the file:

  ```json
  {
    "github.com": {
      "user": "USERNAME",
      "oauth_token": "ghu_YOURTOKEN"
    }
  }
  ```

* Replace USERNAME with your git username and YOURTOKEN with the token you got in step 3.
* Restart Nvim. Run Copilot status. You should be logged in.
