from fastapi.testclient import TestClient

from fastapi_sample.main import app

client = TestClient(app)


def test_check_health():
    response = client.get("/health")
    assert response.status_code == 200
    assert response.json() == {"msg": "Hello World!"}
