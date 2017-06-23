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

![pipeline-graph](https://docs.gitlab.com/ce/ci/img/pipelines.png)

![types](https://docs.gitlab.com/ce/ci/img/types-of-pipelines.svg)

## Aufgaben 
- gitlab-ci.yml Zweck und Konfiguration verstehen
- .gitignore Zweck verstehen

![pipelinegraph](https://docs.gitlab.com/ce/ci/img/cicd_pipeline_infograph.png)


## Beispiele von Pipelines

![Gemischtwarenladen](http://www.bogotobogo.com/DevOps/images/DevOps/PipeLIne/CloudBeesBlog.png)

![Pieline](https://image.slidesharecdn.com/presentationvincentintegrationcontinue-170217204017/95/gitlab-ci-integration-et-dploiement-continue-7-638.jpg?cb=1487364120)