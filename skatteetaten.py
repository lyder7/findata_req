import requests

# Sett opp API-nøkkel
api_key = "DinAPI-nøkkelHer"

# Definer funksjon for å hente informasjon om forskuddsskatt
def get_forskuddsskatt():
    url = "https://data.skatteetaten.no/forskuddsskatt"
    headers = {"Authorization": f"Bearer {api_key}"}
    response = requests.get(url, headers=headers)
    return response.json()

# Definer funksjon for å hente informasjon om merverdiavgift
def get_mva():
    url = "https://data.skatteetaten.no/mva"
    headers = {"Authorization": f"Bearer {api_key}"}
    response = requests.get(url, headers=headers)
    return response.json()

# Definer funksjon for å hente informasjon om arbeidsgiveravgift
def get_arbeidsgiveravgift():
    url = "https://data.skatteetaten.no/ag"
    headers = {"Authorization": f"Bearer {api_key}"}
    response = requests.get(url, headers=headers)
    return response.json()

# Eksempel på bruk av funksjonene
print(get_forskuddsskatt())
print(get_mva())
print(get_arbeidsgiveravgift())
