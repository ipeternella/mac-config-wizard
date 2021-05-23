# Mac Config Wizard

Tired of configuring new MacOS machines? Well, I was...

![Alt text](docs/mac-config-wizard-demo.gif)

Solution? Invoke this shell wizard and it will:

- Ask you which apps that you'd like to install on your MacOS machine;
- Use brew/brew cask to install these apps and even GUI-based ones such as Slack, Chrome.

This automation tool can save you from wasting some several hours of configuration!

## Contributing

- Follow [Google's Shell Style Guide](https://google.github.io/styleguide/shellguide.html);
- Lint the scripts with [Shellcheck](https://github.com/koalaman/shellcheck) (Supported by VSCode, etc.)
- Centralize configurations and global variables on `wizard/settings.sh`;
- Fork and PR!;

## Running the setup Wizard

Clone this repo and run `wizard.sh` with bash:

`bash wizard.sh`

Then, just answer the questions and install the software that you'd like to have!
