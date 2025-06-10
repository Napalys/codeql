from fastapi import FastAPI, Depends

app = FastAPI()

class DataSource:
    def get_data(self, filepath: str):
        with open(filepath, "r") as f:
            return f.readline()

@app.on_event("startup")
def init_file_handler():    
    app.state.file_handler = DataSource()

@app.get("/file/", dependencies=[Depends(init_file_handler)])
async def read_item(path: str):
    return app.state.file_handler.get_data(path)
