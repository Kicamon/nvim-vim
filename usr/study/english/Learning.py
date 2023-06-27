import random
import os

path = "/home/KicamonIce/Documents/study/Note/English/"


class Learning(object):
    def __init__(self, ThisPath):
        self.path = path + ThisPath
        self.AllMyLearning = []
        self.NumberAllInPad = 0
        self.NumberThisLearning = 0
        self.BeforStudy()

    def BeforStudy(self):
        mywords = open(self.path, 'r', encoding="UTF-8")
        for line in mywords:
            w = []
            str = ""
            for char in line:
                if char == '|':
                    w.append(str)
                    str = ""
                else:
                    str += char
            w[2] = int(w[2])
            w[3] = int(w[3])
            self.AllMyLearning.append(w)
        self.NumberAllInPad = int(len(self.AllMyLearning))
        self.AllMyLearning.sort(key=lambda x: (x[2], x[3]))
        mywords.close()

    def UpdateList(self):
        mywords = open(self.path, 'w', encoding="UTF-8")
        for i in self.AllMyLearning:
            mywords.write('|'.join(map(str, i))+'|\n')
        mywords.close()


class Word(Learning):
    def __init__(self, ThisPath):
        super(Word, self).__init__(ThisPath)

    def Menu(self):
        print(f"There are {self.NumberAllInPad} words in pad")
        print("===============================")
        print("Study or Test")
        print("1. Study")
        print("2. Test")
        print("0. End")
        print("===============================")
        op = int(input())
        if op == 1:
            self.study()
        elif op == 2:
            self.test()
        self.UpdateList()

    def study(self):
        HadLearn = []
        for word in self.AllMyLearning:
            os.system("clear")
            print(word[0])
            print(word[1])
            word[3] += 1
            HadLearn.append(word)
            print("\nStudy Continue\ny[yes]/n[no]")
            op = input()
            if op == 'n':
                break

    def test(self):
        print("How many words you want to test?")
        self.NumberThisLearning = int(input())
        order = []
        for i in range(0, self.NumberThisLearning, 1):
            order.append(i)
        random.shuffle(order)
        tmp1 = order
        tmp2 = []

        while len(tmp1) > 0:
            idx = tmp1.pop(0)
            print(self.AllMyLearning[idx][0])
            print("Do you now the word's mean?\n")
            print("y[yes]/n[no]")
            op = input()
            print()
            print("Answer:")
            print(self.AllMyLearning[idx][1])
            if op == 'y':
                print("Are you right?")
                print("y[yes]/n[no]")
                op = input()
                if op == 'y':
                    self.AllMyLearning[idx][2] += 1

            if op == 'n':
                print("Pelase remember it")
                self.AllMyLearning[idx][2] -= 1
                tmp2.append(idx)

            os.system("clear")

            if len(tmp1) == 0:
                if len(tmp2) > 0:
                    random.shuffle(tmp2)
                    tmp1 = tmp2
                    tmp2.clear()
                else:
                    break
