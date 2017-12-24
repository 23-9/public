from tkinter import*
from math import*

class Table:
    def create(self, l, h, entry):
        rows = []
        for i in range(h):
            cols = []
            for j in range(l):
                e = Entry(self,relief=RIDGE,width=4)
                e.grid(row=i, column=j)
                cols.append(e)
                entry[i,j] = e
            rows.append(cols)
    def read(self, l, h,enA,enB):
        for i in range(h):
            for j in range(l):
                self.entryC[i, j].delete(0,END)
                e=int(enA[i,j].get())+int(enB[i,j].get())
                self.entryC[i,j].insert(END, '%d' % (e))

class PlusMatrix:
    def __init__(self,main):
        #Создание элементов
        self.LabelH=Label(main, text="Количество строк:")
        self.LabelL = Label(main, text="Количество столбцов:")
        self.LabelP = Label(main, text="+")
        self.LabelE = Label(main, text="=")
        self.EntryL = Entry(main)
        self.EntryH = Entry(main)
        self.btnCreate = Button(main, text="Составить матрицы")
        self.btnSum = Button(main, text="Посчитать сумму матриц")
        self.Labelfr1 = LabelFrame(main, relief=GROOVE, text="Матрица А")
        self.Labelfr2 = LabelFrame(main, relief=GROOVE, text="Матрица B")
        self.Labelfr3 = LabelFrame(main, relief=GROOVE, text="Матрица C")
        self.LabelError = LabelFrame(main, width=90, height=10, relief=GROOVE, text="Диалоговое окно")
        self.TextError = Text(self.LabelError)

        #Размещение элементов
        self.LabelL.grid(row=0,column=0)
        self.LabelH.grid(row=1,column=0)
        self.EntryL.grid(row=0, column=1)
        self.EntryH.grid(row=1, column=1)
        self.btnCreate.grid(row=0,column=3)
        self.btnSum.grid(row=0, column=4)
        self.Labelfr1.grid(row=3,column=0)
        self.LabelP.grid(row=3, column=1)
        self.Labelfr2.grid(row=3, column=2)
        self.LabelE.grid(row=3, column=3)
        self.Labelfr3.grid(row=3, column=4)
        self.TextError.grid(row=0,column=0)
        self.LabelError.grid(row=5,column=0,columnspan=5)
        self.entryA = {}
        self.entryB = {}
        self.entryC = {}
        self.btnCreate.bind("<Button-1>", self.createTables)
        self.btnSum.bind("<Button-1>", self.sum)

    def sum(self,event):
        try:
            L = int(self.EntryL.get())
            H = int(self.EntryH.get())
            Table.read(self, L, H, self.entryA, self.entryB)
            self.TextError.insert(END, "\n Cложение матрицы А и B: {}X{}. Завершено успешно.".format(H,L))
        except ValueError:
            self.TextError.insert(END, "\nВведены некорректные данные")

    def createTables(self,event):
        try:
            L = int(self.EntryL.get())
            H = int(self.EntryH.get())
            self.Labelfr1.grid()
            self.Labelfr2.grid()
            self.Labelfr3.grid()
            self.MatA = Table.create(self.Labelfr1, L, H, self.entryA)
            self.MatB = Table.create(self.Labelfr2, L, H,self.entryB)
            self.MatC = Table.create(self.Labelfr3, L, H,self.entryC)
            self.btnCreate.destroy()
        except ValueError:
            self.TextError.insert(END, "\nВведены некорректные данные")

root = Tk()
root.title("Plus Matrix")
root.geometry('1024x768')

#Создание объекта класса
PlusMatrix1 = PlusMatrix(root)
root.mainloop()