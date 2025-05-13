//ติดตั้ง
docker run --rm -it -v $(pwd):/code -w /code node:22.15 sh -c "npm create vite@latest frontend -- --template react && cd frontend/ && npm install"

sudo chown -R korn:korn /home/korn/Work/Pirch-App

//restart บ่อยๆ
- docker compose up --watch --build

//ติดตั้ง axios
- docker compose run --rm -v $(pwd)/frontend:/frontend frontend sh -c "npm install axios"

//ติดตั้ง Django ตามลำดับ
- สร้างโฟเดอร์ backend
- docker build .
- docker compose build
- docker compose run --rm backend sh -c "django-admin startproject backend ."
- docker compose run --rm backend sh -c "python manage.py makemigrations"
- python3 -m venv env
- source env/bin/activate
- pip install -r requirements.txt

- docker compose up --watch --build
ตรวจสอบ
http://localhost:8000/api/hello-world/

docker compose run --rm backend python manage.py migrate
or
docker compose exec backend python manage.py migrate
