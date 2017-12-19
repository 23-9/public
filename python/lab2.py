from tkinter import*
from math import*

class Equation:
    def __init__(self,main):
        #Создание элементов
        self.label1 = Label(main, width=5,font=15, text="A:")
        self.entry1 = Entry(main, width=5,font=15)
        self.label2 = Label(main, width=5, font=15, text="B:")
        self.entry2 = Entry(main, width=5,font=15)
        self.label3 = Label(main, width=5, font=15, text="C:")
        self.entry3 = Entry(main, width=5,font=15)
        self.text1 = Text(main, width=20,height=17, font=12)
        self.button1 = Button(main, text="calculate")


        #Размещение элементов
        self.label1.grid(row=0,column=0)
        self.entry1.grid(row=0,column=1)
        self.label2.grid(row=1, column=0)
        self.entry2.grid(row=1, column=1)
        self.label3.grid(row=2, column=0)
        self.entry3.grid(row=2, column=1)
        self.button1.grid(row=3, column=0)
        self.text1.place(x=160,y=0)

        #Кнопка события
        self.button1.bind("<Button-1>", self.result)

        #Метод для подсчета и вывода

    def result(self, event):
        self.text10 = Text(main, width=20, height=17, font=12)
        self.text10.place(x=190, y=0)
        try:
            a = float(self.entry1.get())
            b = float(self.entry2.get())
            c = float(self.entry3.get())
            d = b * b - 4 * a * c
            # Проверка на действующие корни
            if d >= 0 and a!=0:
                x1 = (-b + sqrt(d)) / (2 * a)
                x2 = (-b - sqrt(d)) / (2 * a)
                self.text1.insert(END, "\nОтвет\nX1: {:.2f}\nX2: {:.2f}\n".format(x1, x2) + '----------\n')
            else:
                self.text1.insert(END, "\nДействующих корней,\nНет\n")
        except ValueError:
            self.text1.insert(END, "\nВведены некорректные данные")





root = Tk()
root.title("Equation")
root.geometry('500x400+300+200')

#Создание объекта класса
equation1 = Equation(root)
root.mainloop()