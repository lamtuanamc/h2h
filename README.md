# OneMount Hack2Hire Flutter Project
>    This repository contains 1 service and 1 worker working independently. But they can use the other resources in the
>    repository. Please find their main.go file in `service` and `worker` folders.
    
Please read this guide carefully. If you have the issues with this guide, please feel free to send us your feedback to get support from us.

## Prequiresites:
> Hardware:
> You can make the hack with the PC, laptop or other hardware devices, but we tentatively recommend the laptop with OS installed.
> Your laptop's specifications will make you faster than the others.

- The specification required: 

```
- CPU Intel Core i5 with 4 cores of CPUs or higher
- 4GB Memory or higher
- 128GB SSD storage or higher
```

- The specification recommended: 

```
- CPU Intel Core i7 with 8 cores of CPUs or higher
- 8GB Memory or higher
- 256GB SSD storage or higher
```

> You need to install OS and softwares listed bellow:

- Windows, Linux OS, Macosx are accepted - We're assuming your computer had the OS installed
- IDE: Android Studio, VSCode, Sublime, Vim, Emacs, ... etc

## Guide to setup
### I. Installation
#### 1. IDE
> Depend on your preferring, the guide for setup some IDEs are listed below:

- [Install Android Studio](https://docs.flutter.dev/get-started/editor)
- [Install VSCode](https://docs.flutter.dev/get-started/editor?tab=vscode)

#### 2. Install Flutter

> Please follow the guide below:

- [Install Flutter with latest version](https://docs.flutter.dev/get-started/install)

- Test setup:

```shell
flutter --version
```

This command would be executable, and will return the version of Flutter.


### II. Setup your local dev environment

#### 1. Fork this project to your own project on our gitlab

- Your **Gitlab account** will be included in the `Onboard Email` that you received.
- Please add your public key into **Gitlab account**
- Select the **Fork** button on this project, and fork it to your account.

#### 2. Clone forked project to your local machine

> Please feel free to using any `git client` tool that you prefer or use our way to clone the project:

- If you're using a Windows machine, please use `git-bash` to run the following command. Or if you're using MacOsx/Linux, please use `Terminal` instead.

```shell
git clone https://<git-project-uri>
```

This command will ask you the username and password to authenticate with our gitlab server.

#### 3. Setup project dependencies

```shell
flutter pub get
```

- To create a new Model/Api:

```shell
flutter pub run build_runner build --delete-conflicting-outputs
```

#### 4. Project structure

- Folder [/networking](lib/networking) will define all the api request to the backend server

- Folder [/model](lib/model) will define all `models` that included in this project

*We had some example in this projects, you can use the sample model and api or build your own*

**NOTE AGAIN**: Please feel free to reach us out when you have any issues with this guide to get the support from us.
