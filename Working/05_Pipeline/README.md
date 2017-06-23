# Pipeline - Runner - Build - CI/CD - Automation

## Software
Gitlab, Bitbucket, Jenkins, Ants, Maven, Nexus, Artifactory, usw 

## Erklärungen
Das File .gitlab-ci.yml unterscheidet sich in den verschiednenen Build Systemem.
GitLab, Jenkins, AppVeyor und ähnliche Systeme haben jeweils ihren eigenen Syntax, am Ende des Tages machen jedoch alle das selbe.

## .gitlab-ci.yml
Das YAML File ist eine einfach zu interpretierende Markup Language, angelehnt an XML. 
* [YAML](https://de.wikipedia.org/wiki/YAML)
In dieser Datei werden die Stages beschrieben, welche eine Pipeline durchläuft.
Diese Datei kann sich von Projekt zu Porjekt unterscheiden und unterschiedliche Stages durchlaufen.
Es kann auch unterschieden werden zwischen verschiedenen Branches. 
Bsp. Es werden nur Files deployt von einem Master Branch, nicht aber vom development Branch.

## build.ps1
Die Datei kann auch anders heissen und führt die eigentliche Arbeit aus.
Die möglichen Stages sind hier beschrieben:
*[Gitlab](https://docs.gitlab.com/ee/ci/)
Mögliche Arbeiten, welche von der build.ps1 Datei ausgelöst werden können:
- Code analisieren
- Code testen
- Pakete erstellen
- Dateien kopieren
- usw.

## Definition Pipeline
Die Pipelines könne isch stark voneinenander unterscheiden.
Die Ausprägungen und erledigte Jobs sind beinahe unbegrenzt. 

## Aufgaben 
- gitlab-ci.yml Zweck und Konfiguration verstehen
- .gitignore Zweck verstehen

![pipelinegraph](cicd_pipeline_infograph)