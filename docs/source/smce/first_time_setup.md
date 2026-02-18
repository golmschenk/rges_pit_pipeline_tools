# First time setup

If you believe you need access to the SMCE, contact Greg Olmschenk on the RGES-PIT Slack, and we'll decide if this is the appropriate route for you. If this has already been determined, proceed with the below.

## SSH access

Next, you will need to send an SSH public key to the Roman Project Computing Infrastructure Team so that they can setup an account you can log into. First generate a new SSH key public/private pair. On macOS and Linux, from the terminal, run
```sh
ssh-keygen -t ed25519 -f ~/.ssh/nasa_smce
```
and follow the prompts. This will create two files, the private key `~/.ssh/nasa_smce` and the public key `~/.ssh/nasa_smce.pub`. Never share the private key with anyone. Send the public key along with a preferred username to Greg Olmschenk. Next you need to wait for Roman infrastructure team to set up your account.

Once you have received confirmation from that your SMCE account has been created, add the following to your SSH configuration file (located at `~/.ssh/config` on macOS and Linux). Replace `{your_user_name}` with the username you received.
```
Host smce-east1
    HostName 3.220.181.22
    User {your_user_name}
    IdentityFile ~/.ssh/nasa_smce
```

Now, you should be able to SSH into the SMCE with
```
ssh smce-east1
```
