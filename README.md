# Car Service Management Application

## Описание

Это приложение для управления автосервисом, включающее функционал авторизации пользователей, отображения задач и фильтрации данных. Приложение позволяет сотрудникам и администраторам работать с заказами на ремонт автомобилей и обновлять информацию в базе данных.

### Основные функции:
- Авторизация сотрудников и администраторов через форму входа.
- Отображение списка задач для авторизованного сотрудника.
- Возможность фильтрации задач по марке автомобиля и описанию задачи.
- Обновление статуса задачи.
- Отображение детальной информации о выбранной машине.

### Стек технологий:
- **Backend:** Python (Tkinter для GUI), MySQL (для хранения данных)
- **Frontend:** Tkinter (Python GUI библиотека)
- **База данных:** MySQL

## Установка и запуск

1. Убедитесь, что у вас установлен Python и MySQL.
2. Клонируйте этот репозиторий:
   ```bash
   git clone https://github.com/Kitro7899/CarService_Python.git
3. Установите зависимости:
   ```bash
    pip install mysql-connector-python
4. Создайте базу данных MySQL и импортируйте структуру таблиц.
5. Обновите настройки подключения к базе данных в файле main.py и login.py:
   ```bash
    connection = mysql.connector.connect(
    host='localhost',
    user='root',
    password='0000',
    database='carservice'
    )
6. Запустите приложение:
   ```bash
    python login.py
## Структура проекта
- login.py — Форма авторизации сотрудников и администраторов.
- main.py — Основное приложение для сотрудников, включающее функционал отображения и фильтрации задач.
- admin_app.py — Приложение для администраторов.
- README.md — Файл с описанием проекта.
## Использование
- Для входа как сотрудник, введите свои данные в форме авторизации.
- Для входа как администратор, используйте кнопку "Войти как администратор".
- После входа в систему сотрудник может просматривать свои задачи, фильтровать их по марке автомобиля или описанию задачи, а также обновлять статус задач.
