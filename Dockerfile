# Python 3.12가 설치된 경량 이미지를 기반으로 사용합니다.
FROM python:3.12-slim

# 이후 명령을 실행할 컨테이너 내부 작업 폴더를 /app으로 설정합니다.
WORKDIR /app

# 의존성 목록을 작업 폴더로 복사합니다.
COPY requirements.txt .

# 의존성을 설치하고, 이미지 크기를 줄이기 위해 pip 다운로드 캐시를 남기지 않습니다.
RUN pip install --no-cache-dir -r requirements.txt

# .dockerignore에 지정된 파일을 제외한 프로젝트 전체를 작업 폴더로 복사합니다.
COPY . .

# 앱이 8000 포트를 사용함을 명시합니다. 실제 포트 연결은 docker run -p 등으로 설정합니다.
EXPOSE 8000

# 컨테이너 시작 시 main.py의 app을 실행하고, 모든 네트워크 인터페이스의 8000 포트에서 요청을 받습니다.
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
