from fastapi import FastAPI

app = FastAPI()


@app.get("/healtz", include_in_schema=False)
async def healt_check() -> dict[str, str]:
    return {"message": "OK!"}
