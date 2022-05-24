#  PassGen

The ultimate password manager that uses mathematics and probability to make sure your password are safe. Please make sure to read this entire document to fully understand how to use Passgen.

![Alt Text](./PassGen-Demo.gif)

## Description

PassGen is an interactive password manager that utilizes Swift and advanced mathematics to generate passwords according to various user configurations. Based on the configurations of the user, a password is generated and various formulae are run on the generated password to present its effectivity when used to guard information. On top of generating passwords, the app will also allow you enter your own passwords to run mathematical analyses on them to determine their effectivity. 

## Installation/Usage

Due to the differences in compilation of Swift Playground Apps on both Xcode 13.3.1 (macOS 12.2.1 or 12.3.1) and Swift Playgrounds 4.0.2 on iPadOS 15.3.1, there is a unique way to set up and download Passgen.

This project is built as a Swift Playground app using Xcode 13.3.1 and this app can either work by running on a simulator, or plugging in an iPad and deploying onto the physical device. Both methods are sure to give a unique experience, but a physical device is always preferred.

## Various Disclaimers and Warnings

This Swift Playground App does not use an internet connection so no passwords are sent to the cloud. Furthermore, passwords are not currently saved to the device, to not violate or threatening violating Swift Student Challenge rules. However, this app will soon be deployed to the App Store and will be able to use iCloud or will persist data to the device. Other improvements include specific website tagging, and many others, however this is a simple proof of concept of the various cryptographic methods ensuring the robustness of a password.
