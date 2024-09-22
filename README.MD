
# react native with dockerized android emulator and expo in container

This boilerplate aims to start a react native project with expo and dockerized android emulate. The app is installed on the emulator and can be accessed by reading the expo qr code in your smartphone.

## Getting Started

Follow these steps to set up the project on your local machine.

### Prerequisites

Ensure you have the following installed:
1. ubuntu operation system. I'm testing with ubuntu 22.04
2. Docker
3. Docker Compose
4. Your machine should support virtualization. To check if the virtualization is enabled is:
    ```
    sudo apt install cpu-checker
    kvm-ok
    ```

### Quick Start

1. Update the variable REACT_NATIVE_PACKAGER_HOSTNAME in the .env file with you local ip.
2. To install the necessary dependencies, run the following command: docker compose run android npm install
2. Then docker compose up