#!/usr/bin/python3


name, domain = (input("Please Enter an Email: ")).split("@")
print("Hello " + ((name.split("."))[0]).capitalize() + ", Welcome to " + domain)
