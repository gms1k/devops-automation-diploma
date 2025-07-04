# Використовуємо офіційний образ Python як основу.
# '3.10-slim-buster' означає Python версії 3.10, легку версію на базі Debian Buster.
FROM python:3.10-slim-buster

# Встановлюємо робочу директорію всередині контейнера.
# Всі наступні команди (COPY, RUN) будуть виконуватися в цій папці.
WORKDIR /app

# Копіюємо файл requirements.txt з твого комп'ютера (джерело)
# до поточної робочої директорії в контейнері (призначення).
COPY requirements.txt .

# Встановлюємо всі бібліотеки, перераховані в requirements.txt.
# '--no-cache-dir' - не зберігати тимчасові файли, щоб образ був меншим.
RUN pip install --no-cache-dir -r requirements.txt

# Копіюємо весь інший код твого додатку (всі файли з поточної папки)
# до поточної робочої директорії в контейнері.
COPY . .

# Повідомляємо Docker, що додаток буде слухати з'єднання на порту 8000.
# Це інформація, а не фактичне відкриття порту на твоєму комп'ютері.
EXPOSE 8000

# Команда, яка буде запускатися, коли ти створиш і запустиш контейнер з цього образу.
# Вона запускає наш FastAPI-додаток за допомогою Uvicorn.
# "app:app" означає: з файлу 'app.py' взяти об'єкт 'app' (FastAPI-додаток).
# "--host 0.0.0.0" - дозволяє доступ ззовні контейнера.
# "--port 8000" - слухати на порту 8000.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]