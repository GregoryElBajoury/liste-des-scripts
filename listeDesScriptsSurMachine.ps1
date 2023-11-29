#=============================================================================#
#                                                                             #
# Powershell Script for listing all scripts on a machine                      #
# Author: EL BAJOURY Grégory -                                                #
# Organisation : GA SMART BUILDING                                            #
# Creation Date: 11.29.2023                                                   #
# Version: 1.0                                                                #
#                                                                             #
#=============================================================================#


# Définition des chemins de recherche et des extensions de fichier
$scriptPaths = @("C:\Scripts", "C:\scripts")
$extensions = @("*.ps1", "*.psm1", "*.vbs", "*.xml", "*.bat", "*.cmd")

# Dossiers à exclure (chemins complets)
$excludePaths = @("C:\Windows")

# Création d'une liste vide pour stocker les résultats
$scriptFiles = @()

# Recherche des scripts dans les chemins spécifiés et dans tout C:
foreach ($path in $scriptPaths) {
    if (Test-Path -Path $path) {
        foreach ($ext in $extensions) {
            $scriptFiles += Get-ChildItem -Path $path -Filter $ext -Recurse -ErrorAction SilentlyContinue
        }
    }
}

# Recherche dans tout C: en excluant les dossiers spécifiés
$allFiles = Get-ChildItem -Path "C:\" -Filter $ext -Recurse -ErrorAction SilentlyContinue
foreach ($file in $allFiles) {
    # Vérifier si le fichier se trouve dans un des dossiers à exclure
    $exclude = $false
    foreach ($exPath in $excludePaths) {
        if ($file.FullName.StartsWith($exPath)) {&
            $exclude = $true
            break
        }
    }
    if (-not $exclude) {
        $scriptFiles += $file
    }
}

# Exporter les résultats dans un fichier CSV sur le bureau
$DateTime = Get-Date -Format "dd-MM-yyyy-HH'h'mm"
$OutputFile = "$env:USERPROFILE\Desktop\Liste des scripts_$DateTime.csv"
$scriptFiles | Select-Object FullName, Extension, CreationTime, LastWriteTime, Length | Export-Csv -Path $OutputFile -NoTypeInformation -Delimiter ";" -Encoding UTF8

Write-Host "Les informations sur les scripts ont été exportées avec succès vers $OutputFile"
