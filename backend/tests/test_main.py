from fastapi.testclient import TestClient

from app.main import app

client = TestClient(app)


def test_healtz():
    response = client.get("/healtz")
    assert 200 == response.status_code
    assert {"message": "OK!"} == response.json()
