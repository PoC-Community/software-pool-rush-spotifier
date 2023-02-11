import express from "express"
import z from "zod"
import { StatusCodes } from "http-status-codes";

function middleWare(req: express.Request, res: express.Response, next: express.NextFunction) {
    const shematicToken = z.string();
    const shematicId = z.string();

    try {
        shematicToken.parse(req.header("token"));
        shematicId.parse(req.header("id"));
        next();
    } catch (err) {
        console.log("[Play] Bad Request");
        res.status(StatusCodes.BAD_REQUEST).send("Error while getting the music");
    }
}

export function backPlay(app: express.Application) {
    app.get('/play', middleWare, (req, res) => {
        res.status(StatusCodes.OK).send("Playing Music");
    });
}
