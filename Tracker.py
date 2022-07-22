from covid import Covid

covid = Covid(source="worldometers")

confirmed = covid.get_total_confirmed_cases()
active = covid.get_total_active_cases()
recovered = covid.get_total_recovered()
death = covid.get_total_deaths()

print("""Welcome To Covid19 Tracker""")
print("World Update")

print(f"Total Confirmed Cases: {confirmed}")
print(f"Total Active Cases: {active}")
print(f"Total Recovered: {recovered}")
print(f"Total Death: {death}")
print("Stay Safe")
