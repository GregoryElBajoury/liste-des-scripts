# Script Powershell pour lister les scripts présents sur une machine

## Description
Ce script PowerShell est conçu pour rechercher et lister tous les scripts (fichiers `.ps1`, `.psm1`, `.vbs`, `.xml`, `.bat`, `.cmd`) sur un serveur Windows. Il exporte les résultats dans un fichier CSV, en excluant les scripts situés dans certains dossiers tels que `C:\Windows`.

## Auteur et Organisation
- **Auteur** : EL BAJOURY Grégory
- **Organisation** : GA SMART BUILDING
- **Date de création** : 29.11.2023
- **Version** : 1.0

## Utilisation

### Prérequis
- PowerShell 5.0 ou ultérieur.
- Accès administratif sur la machine où le script sera exécuté.

### Paramètres du Script
- `$scriptPaths` : Chemins où rechercher les scripts.
- `$excludePaths` : Chemins à exclure de la recherche.
- `$extensions` : Types de fichiers de script à rechercher.

### Exécution du Script
Pour exécuter le script, naviguez jusqu'au répertoire contenant le script et utilisez la commande suivante dans PowerShell :

```powershell
.\NomDuScript.ps1
```

###Sortie
Le script exporte les détails des scripts trouvés (chemin complet, extension, dates de création et de dernière modification, taille) dans un fichier CSV nommé Liste des scripts_<DateTime>.csv sur le bureau de l'utilisateur.

### Fonctionnalités

Recherche de scripts dans des chemins spécifiés et sur tout le disque C:.
Exclusion des scripts situés dans des dossiers spécifiques (par exemple, C:\Windows).
Exportation des résultats dans un fichier CSV avec un horodatage pour une identification facile.
Gestion des Erreurs
Le script inclut une gestion basique des erreurs pour capturer et afficher les messages d'erreur en cas de problème lors de l'exécution.

### Licence
Ce script est fourni "tel quel", sans garantie d'aucune sorte.

```
Ce fichier README fournit une vue d'ensemble claire du but et de l'utilisation du script,
ainsi que des informations détaillées sur son exécution et sa sortie. Vous pouvez l'ajuster selon vos besoins spécifiques.
```
