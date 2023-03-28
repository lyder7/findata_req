import requests

# Sett opp API-nøkkel
api_key = "DinAPI-nøkkelHer"

# Definer funksjon for å hente informasjon om årsregnskap
def get_årsregnskap(orgnr):
    url = f"https://data.brreg.no/enhetsregisteret/api/underenhet/{orgnr}/regnskap"
    headers = {"Authorization": f"Bearer {api_key}"}
    response = requests.get(url, headers=headers)
    return response.json()

# Definer funksjon for å hente informasjon om årsberetning
def get_årsberetning(orgnr):
    url = f"https://data.brreg.no/enhetsregisteret/api/underenhet/{orgnr}/aarsberetning"
    headers = {"Authorization": f"Bearer {api_key}"}
    response = requests.get(url, headers=headers)
    return response.json()

# Definer funksjon for å hente informasjon om revisjonsberetning
def get_revisjonsberetning(orgnr):
    url = f"https://data.brreg.no/enhetsregisteret/api/underenhet/{orgnr}/revisjonsberetning"
    headers = {"Authorization": f"Bearer {api_key}"}
    response = requests.get(url, headers=headers)
    return response.json()

# Eksempel på bruk av funksjonene
print(get_årsregnskap("123456789"))
print(get_årsberetning("123456789"))
print(get_revisjonsberetning("123456789"))
