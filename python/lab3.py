from tkinter import*
from math import*

class Comparison:
    def __init__(self,main):
        #Создание элементов
        self.Labelfr1 = LabelFrame(main,width=200,height=100,relief=GROOVE,text ="Исходные данные")
        self.Label1=Label(self.Labelfr1, text="A=")
        self.Label2 = Label(self.Labelfr1, text="B=")
        self.Label3 = Label(self.Labelfr1, text="C=")
        self.Entry1 = Entry(self.Labelfr1)
        self.Entry2 = Entry(self.Labelfr1)
        self.Entry3 = Entry(self.Labelfr1)
        self.Labelfr2 = LabelFrame(main, width=600, height=100, relief=GROOVE, text="Результат")
        self.Text1 = Text(self.Labelfr2,width=600, height=4)
        #Размещение элементов
        self.Labelfr1.grid(row=0,column=0)
        self.Label1.grid(row=0,column=0)
        self.Label2.grid(row=1, column=0)
        self.Label3.grid(row=2, column=0)
        self.Entry1.grid(row=0, column=1)
        self.Entry2.grid(row=1, column=1)
        self.Entry3.grid(row=2, column=1)

        self.Labelfr2.grid(row=0, column=1)
        self.Text1.grid()

        # Cобытия
        self.Entry1.bind("<KeyRelease>", self.result)
        self.Entry2.bind("<KeyRelease>", self.result)
        self.Entry3.bind("<KeyRelease>", self.result)

    def result(self, event):
        try:
            a = float(self.Entry1.get())
            b = float(self.Entry2.get())
            c = float(self.Entry3.get())
            list = [a, b, c]
            list.sort()
            self.Text1.insert(END, "\nОтвет:{:}".format(list))
        except ValueError:
            self.Text1.insert(END, "\nВведены некорректные данные")

root = Tk()
root.title("Comparison")
root.geometry('480x320')

#Создание объекта класса
Comparison1 = Comparison(root)
root.mainloop()