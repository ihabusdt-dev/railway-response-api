FROM python:3.11-slim

# تثبيت FFmpeg و Git وأداة إصلاح الأسطر
RUN apt-get update && apt-get install -y \
    ffmpeg \
    git \
    dos2unix \
    && rm -rf /var/lib/apt/lists/*

# إنشاء مجلد العمل
WORKDIR /app

# نسخ الملفات
COPY . .

# تحويل صيغة الأسطر من Windows (CRLF) إلى Linux (LF)
RUN dos2unix start.sh hun.py || true

# إعطاء صلاحيات التنفيذ
RUN chmod +x start.sh hun.py ./tiny/ffmpeg

# أمر التشغيل
CMD ["./start.sh"]