# Splunk in 3 minutes

Setting up an environment may take some of your time. This repository aims to get a local playground environment up quickly. It will require internet access at the start then everything can go offline and disconnected once setup. The 5 forwarders come built-in to simulate multiple h9sts and sources, where references for queries are scattered around internet, for example, https://www.stationx.net/splunk-cheat-sheet/.

## What does this repo do?

- Create Splunk Enterprise trial container (This should allow us to play with Alert)
- Create 5 Splunk forwarder containers with log generator script (Credit the generator script to Josh Samuelson from the [Learning Splunk course](https://www.linkedin.com/learning/learning-splunk-22169111)).

## Pre-requisites

- Internet connection
- Docker

## The two scripts

- splunk.sh : Setup environment by creating a bridge network for Splunk and 5 nodes with Splunk Forwarders
- cleanup.sh : Clean up all the containers and network bridge

### 5 Hosts

![Screenshot_2025-03-11_20-48-06](https://github.com/user-attachments/assets/adc29bc7-ec7d-43f0-be6d-4b589795c3c6)

### Queries

![Screenshot_2025-03-11_11-30-17](https://github.com/user-attachments/assets/16321cd1-6afe-437e-a3b5-ce9dce7725f7)
![Screenshot_2025-03-11_16-21-42](https://github.com/user-attachments/assets/2b40875c-c549-4623-b2fa-934c7abdeb66)
![Screenshot_2025-03-11_12-08-41](https://github.com/user-attachments/assets/9e99a709-f1d8-4245-9d66-8fe599a41364)
![Screenshot_2025-03-11_11-45-53](https://github.com/user-attachments/assets/d5f1286b-4a1a-4e6d-ad85-7eb5240b3608)
![Screenshot_2025-03-11_11-36-49](https://github.com/user-attachments/assets/df1e5e6b-8584-461e-a13a-28bbf8f4af58)
![Screenshot_2025-03-11_11-35-20](https://github.com/user-attachments/assets/dd8d82d8-74d7-4369-8ba1-dd3601f00c97)
