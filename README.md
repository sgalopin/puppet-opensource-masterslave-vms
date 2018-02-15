# Puppet open source en architecture maître/esclave avec Puppetfile (r10k)
Création et configuration de machines virtuelles (maître/esclave) pour tester la version open source de Puppet.

## Installation

### Installation des machines virtuelles (VM)

Vagrant est utilisé pour instancier la machine virtuelle.
- Installer [VirtualBox](https://www.virtualbox.org/wiki/Downloads),
- Installer [Vagrant](https://www.vagrantup.com/downloads.html),
- Installer [Git](https://git-scm.com/downloads),
- Cloner le dépôt:
    - Ouvrir un Git Bash:
        - Se placer dans le répertoire dans lequel vous souhaitez installer le projet,
        - Cliquer sur le bouton droit de la souris,
        - Cliquer sur 'Git Bash',
        - Taper la ligne de commande suivante: 'git clone https://github.com/sgalopin/<nomdudépôt>.git'.

### Lancer les VMs, valider le certificat client, installer l'application

Se placer dans le répertoire dans lequel vous avez installé le projet:
- Ouvrir une console ('clic droit' puis 'Git Bash Here'),
- Taper la commande 'cd master && vagrant up' (Lance la VM maître),
- Taper la commande 'cd ../agent && vagrant up' (Lance la VM esclave),
- Taper la commande 'cd ../master && vagrant provision --provision-with sign-node-requests' (Signe les certificats),
- Taper la commande 'cd ../agent && vagrant provision --provision-with run' (Installe l'application).

### Documentation Puppet utile

- [Puppet 5.3 (Open Source Puppet)](https://puppet.com/docs/puppet/5.3/index.html)


- Modules:
  - [Puppet Forge](https://forge.puppet.com)
  - [Module fundamentals](https://puppet.com/docs/puppet/5.3/modules_fundamentals.html)
  - [Beginner's guide to writing modules](https://puppet.com/docs/puppet/5.3/bgtm.html)
  - [The Puppet Language Style Guide](https://puppet.com/docs/puppet/5.3/style_guide.html)


- Certificats:
  - [Regenerate Puppet agent certificates](https://puppet.com/docs/pe/2017.3/ssl_and_certificates/regenerate_puppet_agent_certificates.html)
  - [Regenerate Puppet master certificates](https://puppet.com/docs/pe/2017.3/ssl_and_certificates/regenerating_certificates_monolithic_installs.html)


- Environnements de déploiement:
  - [r10k](https://github.com/puppetlabs/r10k)

## Désinstallation

- Dans Git Bash (A faire pour les deux VMs):
  - **$ vagrant halt**: Stope la VM.
  - **$ vagrant destroy**: Supprime la VM.
- Supprimer les sources,
- Supprimer VirtualBox, Vagrant, Git.

## Développement

### Commandes Vagrant
- **$ vagrant up**: Crée la VM.
- **$ vagrant reload**: Recharge la configuration de la VM.
- **$ vagrant ssh**: Ouvre une console ssh vers le serveur.
- **$ vagrant halt**: Stope la VM.
- **$ vagrant destroy**: Supprime la VM.


- Sur la VM maître:
  - **$ vagrant provision --provision-with sign-node-requests**: Signe les certificats des agents (VMs esclaves).
  - **$ vagrant provision --provision-with clean-master-cert**: Supprime les certificats du maître et les recrée.
  - **$ vagrant provision --provision-with clean-agent-cert**: Supprime les certificats de l'agent en local et les recrée.


- Sur la VM esclave (agent):
  - **$ vagrant provision --provision-with run**: Installe l'application (Lance un unique run verbeux).
  - **$ vagrant provision --provision-with clean-agent-cert**: Supprime les certificats et refait une demande au master.

### Commande Puppet
- **$ puppet config print certname**: Affiche le nom du certificat.
