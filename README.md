# FastAPI AWS 배포 테스트

`GET /` 요청에 HTTP 200과 텍스트 `Hello World`를 반환합니다.

## 로컬 실행

```sh
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
uvicorn main:app --host 0.0.0.0 --port 8000
```

확인: `curl http://localhost:8000/`

## Docker 실행

```sh
docker build -t fastapi-hello .
docker run --rm -p 8000:8000 fastapi-hello
```

AWS 컨테이너 배포 시 컨테이너 포트는 `8000`, 헬스 체크 경로는 `/`로 설정합니다.
