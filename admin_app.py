import tkinter as tk

class AdminApp:
    def __init__(self, master=None):
        self.master = master if master else tk.Tk()
        self.master.title("Администратор")
        self.master.geometry('1400x650+300+150')

        self.create_widgets()

    def create_widgets(self):
        tk.Label(self.master, text="Добро пожаловать, администратор!").pack(pady=20)

    def run(self):
        self.master.mainloop()

# Удаляем функцию run_admin_app, так как она не требуется
