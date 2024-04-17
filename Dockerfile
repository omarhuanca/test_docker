# Usar una imagen base de Python
FROM python:3.8

# Instalar dependencias para Chrome
RUN apt-get update && apt-get install -y wget \
&& wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
&& sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' \
&& apt-get update && apt-get install -y google-chrome-stable

# Instalar ChromeDriver
RUN wget -q "https://chromedriver.storage.googleapis.com/2.41/chromedriver_linux64.zip" \
&& unzip chromedriver_linux64.zip -d /usr/local/bin/ \
&& rm chromedriver_linux64.zip

# Instalar Selenium
RUN pip install selenium

RUN pip install webdriver-manager

# Copiar el script de Selenium de tu proyecto al contenedor
COPY . /app
WORKDIR /app

# Definir el volumen para los datos de Selenium
VOLUME /app/data

# Ejecutar el script de Selenium al iniciar el contenedor
CMD ["python", "test.py"]