# RHCE 9 Web-Based Documentation Repo
This repo contains an offline copy of docs.ansible.com versioned specifically for the RHCE 9 exam.

## Background
In the RHCE 9 exam the available documentation consists of what you can find in `ansible-doc`, `ansible-navigator`, as well as an offline cached copy of `docs.ansible.com`. The `docs.ansible.com` is an exact version, cached copy, with no search functionality, so you need to be well-versed in navigating with the sidebar and hyperlinks throughout the site.

The RHCE 9 exam is basec on RHEL 9.0 and Ansible Automation Platform 2.2. The primary Ansible engine in Ansible Automation Platform 2.2 is Ansible Core 2.13. The open-source version of the Ansible suite this lines up to is Ansible 6.0. In determining where to find the exact version of the website to clone for study, I looked at the release dates for the following components:

- 2022-05-16 - Ansible-core-2.13 released.
- 2022-05-26 - Ansible Automation Platform 2.2 released
- 2022-06-21 - Ansible-6.0.0 released.

The Wayback Machine (web.archive.org) has multiple snapshots of `docs.ansible.com`. There are full snapshots on 12 June 2022 as well as 9 July 2022. In evaluating both, I found that the 12 June copy corresponds to Ansible 5 and the 9 July copy corresponds to Ansible 6.

Using `wayback_machine_downloader` I was able to download an entire copy of the website using 15 July 2022 as a cutoff. I then found the search function in the html pages and removed it with a `sed` command.

After the download and tweaks, the website should now be a fairly accurate copy of what is available in the RHCE 9 exam and can be used when building a lab for exam preparation.

## Prerequisites
- A functional web server (e.g. apache, nginx, etc.)

## Usage
To get this up and running, simply clone it into the data folder of a functional web server using the following command:
```
git clone git@github.com:aggressiveHiker/rhce9-docs-ansible.git
```

## Repoduction
This website was built on a minimal install of RHEL 9.0 with httpd installed. Here are the steps that were taken to produce this repo, so you can reproduce it on your own if you would like:
```
## Install ruby and httpd
dnf install -y ruby httpd

### Install wayback_machine_downloader
gem install wayback_machine_downloader

### Enable httpd and allow it through the firewall
systemctl enable --now httpd
firewall-cmd --add-service=http --permanent
firewall-cmd --reload

### Download the 9 July 2022 snapshot of docs.ansible.com, using 15 July 2022 as the cutoff
wayback_machine_downloader https://docs.ansible.com/ansible/latest/ -t 20220715 -d /var/www/html/

### Break the search engine
find /var/www/html/ansible/ -iname "*.html" -exec sed -i -e '/^<div\ role="search"/,/div>$/d' {} \;
```
---

### Resources / References / Acknowledgements
The following resources were used to produce this project:
- https://docs.ansible.com/ansible/latest/
- https://github.com/hartator/wayback-machine-downloader
- https://web.archive.org/web/20220709015704/https://docs.ansible.com/ansible/latest/
