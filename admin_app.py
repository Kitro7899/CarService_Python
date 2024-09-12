import tkinter as tk
from tkinter import ttk, messagebox
import mysql.connector

class AdminApp:
    def __init__(self, master=None):
        self.master = master if master else tk.Tk()
        self.master.title("Администратор")
        self.master.geometry('1400x650+300+150')
        self.master['bg'] = 'grey'
        self.master.resizable(False, False)
        self.create_widgets()
        self.selected_car_make = None  # Инициализация
        self.selected_car_model = None  # Инициализация

    def fetch_data_from_db(self):
        query = """
        SELECT employees.last_name, cars.make, orders.task, orders.status, employees.phone_number, employees.email, orders.dead_line
        FROM orders
        JOIN employees ON employees.id = orders.employee_id
        JOIN cars ON cars.id = orders.car_id;
        """
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

    def fetch_cars_from_db(self):
        """Получает список всех доступных машин из базы данных."""
        query = """
        SELECT make, model, year, color, last_service_date, vin_number FROM cars;
        """
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





    def get_id_from_employee_name(self, table, column, name):
        """Получает ID из таблицы по имени."""
        query = f"SELECT id FROM {table} WHERE {column} = %s"
        connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password='0000',
            database='carservice'
        )
        cursor = connection.cursor()
        cursor.execute(query, (name,))
        result = cursor.fetchone()
        connection.close()
        return result[0] if result else None

    def add_order_to_db(self, task, car_make, car_model, deadline, employee_last_name, status="не выполнен"):
        # Получаем ID сотрудника и ID машины по их названиям
        employee_id = self.get_id_from_employee_name('employees', 'last_name', employee_last_name)
        car_id = self.get_id_from_car(car_make, car_model)

        # Проверяем, что все данные корректны
        if not task or not car_id or not deadline or not employee_id:
            messagebox.showerror("Ошибка", "Все поля должны быть заполнены корректно!")
            return

        try:
            connection = mysql.connector.connect(
                host='localhost',
                user='root',
                password='0000',
                database='carservice'
            )
            cursor = connection.cursor()
            query = """
               INSERT INTO orders (employee_id, car_id, task, dead_line, status)
               VALUES (%s, %s, %s, %s, %s)
               """
            cursor.execute(query, (employee_id, car_id, task, deadline, status))
            connection.commit()
            connection.close()
            messagebox.showinfo("Успех", "Заказ успешно добавлен!")
            self.clear_add_order_form()  # Очищаем поля после сохранения
        except mysql.connector.Error as err:
            messagebox.showerror("Ошибка", f"Ошибка добавления заказа: {err}")

    def get_id_from_car(self, make, model):
        """Получает ID машины из таблицы по марке и модели."""
        query = "SELECT id FROM cars WHERE make = %s AND model = %s"
        connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password='0000',
            database='carservice'
        )
        cursor = connection.cursor()
        cursor.execute(query, (make, model))
        result = cursor.fetchone()
        connection.close()
        return result[0] if result else None

    def add_order(self):
        # Создаем новое окно
        self.add_ord = tk.Toplevel(self.master)
        self.add_ord.title("Добавить заказ")
        self.add_ord.geometry('1200x600+300+150')
        self.add_ord['bg'] = 'darkgray'

        filter_addForm = tk.Frame(self.add_ord)
        filter_addForm.place(x=410, y=500, width=400, height=100)
        filter_addForm['bg'] = "lightgray"

        f_button = tk.Button(filter_addForm, text="Фильтровать")
        f_button.grid(row=1, column=3, padx=10, pady=10)


        tk.Label(filter_addForm, text="марка:").grid(row=1, column=0, padx=10, pady=10, sticky='e')
        self.car_make_entry2 = tk.Entry(filter_addForm)
        self.car_make_entry2.grid(row=1, column=1, padx=10, pady=10)


        tk.Label(filter_addForm, text="модель:").grid(row=2, column=0, padx=10, pady=10, sticky='e')
        self.task_entry_model2 = tk.Entry(filter_addForm)
        self.task_entry_model2.grid(row=2, column=1, padx=10, pady=10)


        add_form = tk.Frame(self.add_ord, bg="lightgray")
        add_form.place(x=0, y=0, width=400, height=600)
        add_form['bg'] = "lightgray"
        tk.Label(add_form, text="Добавить новый заказ", font=('Arial', 18)).grid(row=0, column=0, columnspan=2, pady=20)

        # Поля ввода для задачи
        tk.Label(add_form, text="Введите задачу:").grid(row=1, column=0, padx=10, pady=10, sticky='e')
        self.task_entry = tk.Entry(add_form)  # Объявлено как self.task_entry для доступа в других методах
        self.task_entry.grid(row=1, column=1, padx=10, pady=10)

        # Поля ввода для срока (deadline)
        tk.Label(add_form, text="Введите срок:").grid(row=2, column=0, padx=10, pady=10, sticky='e')
        self.deadline_entry = tk.Entry(add_form)  # Объявлено как self.deadline_entry для доступа в других методах
        self.deadline_entry.grid(row=2, column=1, padx=10, pady=10)

        # Поля ввода для сотрудника (employee_last_name)
        tk.Label(add_form, text="Введите фамилию сотрудника:").grid(row=3, column=0, padx=10, pady=10, sticky='e')
        self.employee_name_entry = tk.Entry(
            add_form)  # Объявлено как self.employee_name_entry для доступа в других методах
        self.employee_name_entry.grid(row=3, column=1, padx=10, pady=10)

        # Кнопка сохранения
        save_button = tk.Button(add_form, text="Сохранить", command=lambda: self.add_order_to_db(
            self.task_entry.get(), self.selected_car_make, self.selected_car_model, self.deadline_entry.get(),
            self.employee_name_entry.get()
        ))
        save_button.grid(row=4, column=1, padx=10, pady=20)

        # Создаем таблицу для отображения машин
        columns = ("#1", "#2", "#3", "#4", "#5", "#6")
        self.car_table = ttk.Treeview(self.add_ord, columns=columns, show="headings")
        self.car_table.place(x=400, y=0, width=800, height=500)

        self.car_table.column("#1", width=120, stretch=False)  # Марка
        self.car_table.column("#2", width=120, stretch=False)  # Модель
        self.car_table.column("#3", width=80, stretch=False)  # Год
        self.car_table.column("#4", width=80, stretch=False)  # Цвет
        self.car_table.column("#5", width=150, stretch=False)  # Последнее обслуживание
        self.car_table.column("#6", width=150, stretch=False)  # VIN

        self.car_table.heading("#1", text="Марка")
        self.car_table.heading("#2", text="Модель")
        self.car_table.heading("#3", text="Год")
        self.car_table.heading("#4", text="Цвет")
        self.car_table.heading("#5", text="Последнее обслуживание")
        self.car_table.heading("#6", text="VIN")

        # Загрузка данных машин в таблицу
        self.load_car_data()

        # Выбор автомобиля при клике на строку
        self.car_table.bind("<<TreeviewSelect>>", self.on_car_table_select)

    def load_car_data(self):
        """Загружает данные о машинах в таблицу."""
        car_data = self.fetch_cars_from_db()
        for row in car_data:
            self.car_table.insert("", tk.END, values=row)

    def on_car_table_select(self, event):
        """Обрабатывает выбор строки в таблице машин."""
        selected_item = self.car_table.selection()
        if selected_item:
            item = self.car_table.item(selected_item)
            values = item['values']
            # Сохраняем марку и модель выбранного автомобиля
            self.selected_car_make = values[0]
            self.selected_car_model = values[1]

    def clear_add_order_form(self):
        """Очищает поля ввода в форме добавления заказа."""
        self.task_entry.delete(0, tk.END)
        self.deadline_entry.delete(0, tk.END)
        self.employee_name_entry.delete(0, tk.END)
        # Сброс выбора в таблице машин
        self.car_table.selection_remove(self.car_table.selection())

    def create_widgets(self):
        # Поля для фильтрации
        filter_btns = tk.Frame(self.master, bg="lightgrey")
        filter_btns.place(x=850, y=0, width=500, height=140)
        filter_btns['bg'] = "white"
        tk.Label(filter_btns, text="Фильтр по марке машины:").grid(row=0, column=0, padx=5, pady=5, sticky="ew")
        self.car_make_entry = tk.Entry(filter_btns)
        self.car_make_entry.grid(row=0, column=1, padx=5, pady=5, sticky="ew")

        tk.Label(filter_btns, text="Фильтр по задаче:").grid(row=1, column=0, padx=5, pady=5, sticky="ew")
        self.task_description_entry = tk.Entry(filter_btns)
        self.task_description_entry.grid(row=1, column=1, padx=5, pady=5, sticky="ew")

        filter_button = tk.Button(filter_btns, text="Фильтровать", command=self.refresh_table)
        filter_button.grid(row=2, column=1, padx=5, pady=5, sticky="ew")

        add_button = tk.Button(filter_btns, text="Добавить заказ", command=self.add_order)
        add_button.grid(row=3, column=1, padx=5, pady=5, sticky="ew")

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
