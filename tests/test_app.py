from fastapi.testclient import TestClient # Інструмент для тестування FastAPI
from app import app # Імпортуємо наш додаток з файлу app.py

# Створюємо "тестовий клієнт", який може надсилати запити до нашого додатку
client = TestClient(app)

# Функція тесту. Назва має починатися з 'test_'.
def test_read_root():
    # Відправляємо GET-запит на головну адресу "/"
    response = client.get("/")

    # Перевіряємо, що статус відповіді 200 (ОК)
    assert response.status_code == 200

    # Перевіряємо, що JSON-відповідь відповідає очікуванням
    assert response.json() == {"message": "Привіт, DevOps! Це наш перший додаток."}