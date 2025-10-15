# 1️⃣ Use official Python image
FROM python:3.10-slim

# 2️⃣ Set working directory inside the container
WORKDIR /app

# 3️⃣ Install system dependencies for MySQL (if using) and Python packages
RUN apt-get update && apt-get install -y \
    default-libmysqlclient-dev gcc \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# 4️⃣ Copy project files into container
COPY . .

# 5️⃣ Install Python dependencies
# If you have requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# If no requirements.txt, install manually
#RUN pip install --no-cache-dir flask sqlalchemy pymysql

# 6️⃣ Expose Flask port
EXPOSE 5000

# 7️⃣ Environment variables
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# 8️⃣ Run the app
CMD ["flask", "run"]
