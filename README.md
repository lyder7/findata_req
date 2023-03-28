## **findata_req**



findata_req er et Python-bibliotek for å hente finansiell entitetsinformasjon i Norge fra Skatteetaten sitt delingssenter API.

Installasjon
For å installere findata_req, bruk pip:

Copy code
```
pip install findata_req
```



### Eksempel på hvordan du bruker findata_req for å hente informasjon om en finansiell entitet:

python
```
from findata_req import EntityRequest

req = EntityRequest()
entity_data = req.get_entity_data("123456789") # erstatt med organisasjonsnummeret du vil hente data for
print(entity_data)
```
### Dokumentasjon
Du kan finne dokumentasjon for Skatteetaten sitt delingssenter API her:

saf-t skatteetaten
SAF-T Skatteetaten Skatteetatens delingssenter API Dokumentasjon

Du kan også finne dokumentasjon for biblioteket på GitHub-siden vår:

Documentation

Lisens
Dette prosjektet er lisensiert under MIT-lisensen. Se LICENSE for mer informasjon.

Kontakt
Hvis du har spørsmål eller tilbakemeldinger, kan du kontakte meg på lyder7@gmail.com eller på GitHub-profilen min.

