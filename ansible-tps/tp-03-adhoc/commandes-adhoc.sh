#!/bin/bash
# =============================================================
# TP 03 — Commandes Ad-Hoc Ansible
# Script regroupant toutes les commandes ad-hoc du TP
# Formation DevOps — Logwire Consulting — Houcem KHLIFI
# =============================================================

echo "=== Test de connectivité ==="
ansible all -m ping

echo ""
echo "=== Exécution de commandes système ==="
# Redémarrer tous les hôtes (attention : décommentez avec précaution)
# ansible all -a "/sbin/reboot" -b

echo ""
echo "=== Copie de fichiers ==="
ansible all -m copy -a "src=/home/dan dest=/tmp/home"

echo ""
echo "=== Gestion des utilisateurs ==="
# Créer un utilisateur testuser
ansible all -m user -a "name=testuser password=<encrypted_password>" -b

# Supprimer l'utilisateur testuser
# ansible all -m user -a "name=testuser state=absent" -b

echo ""
echo "=== Gestion des permissions ==="
ansible all -m file -a "dest=/home/dan/file1.txt mode=777"

echo ""
echo "=== Installation de packages ==="
# Installation avec yum (CentOS/RedHat)
ansible all -m yum -a "name=httpd state=latest" -b

# Installation avec apt (Ubuntu/Debian)
ansible all -m apt -a "name=nginx state=latest" -b

echo ""
echo "=== Gestion des services ==="
# Démarrer httpd
ansible all -m service -a "name=httpd state=started" -b

# Arrêter nginx
ansible all -m service -a "name=nginx state=stopped" -b

echo ""
echo "=== Commandes avec become ==="
ansible all -b -a "ls /root"

echo ""
echo "=== Commande shell ==="
ansible all -m shell -a "uname -a"
