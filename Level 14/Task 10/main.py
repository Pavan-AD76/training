# Deploy an API endpoint

from pydantic import BaseModel
from fastapi import FastAPI, HTTPException
from typing import List

class MatchCommentary(BaseModel):
    match_id: int
    match_title: str
    teams: List[str]
    scores: List[str]
    commentary: str

app = FastAPI()

match_data_list = [
    {
        "match_id": 1,
        "match_title": "India vs Australia - 1st ODI",
        "teams": ["India", "Australia"],
        "scores": ["India 250/8", "Australia 240/10"],
        "commentary": "India wins by 10 runs!"
    },
    {
        "match_id": 2,
        "match_title": "England vs South Africa - Test",
        "teams": ["England", "South Africa"],
        "scores": ["England 400/9", "South Africa 350/10"],
        "commentary": "Stokes scores a century."
    }
]

class MatchCommentary(BaseModel):
    match_id: int
    match_title: str
    teams: List[str]
    scores: List[str]
    commentary: str

@app.get("/get/{match_id}", response_model=MatchCommentary)
def get_match_commentary(match_id: int):
    for match in match_data_list:
        if match["match_id"] == match_id:
            return match
    raise HTTPException(status_code=404, detail="Match not found")

