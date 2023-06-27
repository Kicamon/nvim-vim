import os
import Learning

print("===============================")
print("Choose what you want to study: ")
print("1. My words")
print("2. Word pad")
print("0. End")
print("===============================")

op = int(input())
os.system("clear")
if op == 1:
    study = Learning.Word('MyWords.txt')
    study.Menu()
elif op == 2:
    study = Learning.Word('PubMed.txt')
    study.Menu()
