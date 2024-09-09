import tkinter as tk
from tkinter import ttk
import mysql.connector
import subprocess





class AdminApp:
    def __init__(self, master=None):
        self.master = master if master else tk.Tk()
        self.master.title("Администратор")
        self.master.geometry('1400x650+300+150')
        self.master['bg'] = 'grey'

        self.create_widgets()

    def fetch_data_from_db(self):
        query = """
        SELECT employees.last_name, cars.make, orders.task, orders.status, employees.phone_number, employees.email, orders.dead_line
        FROM orders
        JOIN employees ON employees.id = orders.employee_id
        JOIN cars ON cars.id = orders.car_id;
        """  # Запрос без фильтрации по employee_id
        connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password='0000',
            database='carservice'
        )
        cursor = connection.cursor()
        cursor.execute(query)
        result = cursor.fetchall()
        connection.close()
        return result



    def refresh_table(self):
        # Получаем данные из базы данных
        self.data = self.fetch_data_from_db()

        # Получаем данные для фильтров
        search_make = self.car_make_entry.get().strip()
        search_task = self.task_description_entry.get().strip()

        # Очищаем таблицу перед фильтрацией
        for item in self.tree.get_children():
            self.tree.delete(item)

        # Фильтруем по марке машины
        filtered_data = [item for item in self.data if
                         search_make.lower() in item[1].lower()] if search_make else self.data

        # Затем фильтруем по описанию задачи
        filtered_data = [item for item in filtered_data if
                         search_task.lower() in item[2].lower()] if search_task else filtered_data

        # Добавляем отфильтрованные данные в таблицу
        for item in filtered_data:
            self.tree.insert("", tk.END, values=item)





    def create_widgets(self):
        # Поля для фильтрации
        filter_btns = tk.Frame(self.master, bg="lightgrey")
        filter_btns.place(x=850, y=0, width=500, height=140)  # Adjust these values as per your layout needs
        filter_btns['bg'] = "white"
        tk.Label(filter_btns, text="Фильтр по марке машины:").grid(row=0, column=0, padx=5, pady=5, sticky="ew")
        self.car_make_entry = tk.Entry(filter_btns)
        self.car_make_entry.grid(row=0, column=1, padx=5, pady=5, sticky="ew")

        tk.Label(filter_btns, text="Фильтр по задаче:").grid(row=1, column=0, padx=5, pady=5, sticky="ew")
        self.task_description_entry = tk.Entry(filter_btns)
        self.task_description_entry.grid(row=1, column=1, padx=5, pady=5, sticky="ew")

        filter_button = tk.Button(filter_btns, text="Фильтровать", command=self.refresh_table)
        filter_button.grid(row=2, column=1, padx=5, pady=5, sticky="ew")



        # Создаем таблицу
        columns = ("#1", "#2", "#3", "#4", "#5", "#6", "#7")
        self.tree = ttk.Treeview(columns=columns, show="headings")
        self.tree.place(x=0, y=0, width=800, height=500)

        scrollbar_tree = ttk.Scrollbar(orient=tk.VERTICAL, command=self.tree.yview)
        scrollbar_tree.place(x=800, y=0, height=499)
        self.tree.configure(yscrollcommand=scrollbar_tree.set)

        self.tree.column("#1", width=80, stretch=False)  # Фамилия сотрудника
        self.tree.column("#2", width=80, stretch=False)  # Марка машины
        self.tree.column("#3", width=200, stretch=False)  # Задача
        self.tree.column("#4", width=100, stretch=False)  # Статус
        self.tree.column("#5", width=100, stretch=False)  # Телефон
        self.tree.column("#6", width=125, stretch=False)  # Почта
        self.tree.column("#7", width=100, stretch=False)  # Дедлайн

        self.tree.heading("#1", text="Фамилия")
        self.tree.heading("#2", text="Машины")
        self.tree.heading("#3", text="Задача")
        self.tree.heading("#4", text="Статус")
        self.tree.heading("#5", text="Телефон")
        self.tree.heading("#6", text="Почта")
        self.tree.heading("#7", text="Срок")

        self.refresh_table()

    def run(self):
        self.master.mainloop()
