# get-aws-sso-creds
Export AWS credentials into your current terminal.

## Dependencies
Requires [AWS CLI](https://aws.amazon.com/cli/).

## Setup
[Configure AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html?icmpid=docs_sso_user_portal)
```sh
aws configure sso
```
Create a bin directory in your $HOME directory.
```sh
mkdir ~/bin
```
Add the bin directory to your path.
```sh
echo "export PATH=~/bin:\$PATH" >> ~/.zprofile
```
Add `get-aws-creds.sh` to the bin directory.
```sh
cp get-aws-creds.sh ~/bin
```
Make the file executable.
```sh
chmod +x ~/bin/get-aws-creds.sh
```
Create an alias for the script.
```sh
echo "alias getAwsCreds='. get-aws-creds.sh'" >> ~/.zprofile
```

## Usage
```sh
getAwsCreds --profile my-profile
```