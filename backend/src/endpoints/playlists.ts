import express from "express"
import z from "zod"
import { StatusCodes } from "http-status-codes";
import jwt from "jsonwebtoken";

function middleWare(req: express.Request, res: express.Response, next: express.NextFunction) {
    const shematicToken = z.string();
    const shematicId = z.string();

    try {
        shematicToken.parse(req.header("token"));
        shematicId.parse(req.header("id"));
        next();
    } catch (err) {
        console.log("[Playlist.Add] Bad Request");
        res.status(StatusCodes.BAD_REQUEST).send("Error while getting the music");
    }
}

function getUserInfoFromToken(token: string)
{
    try {
        const infos = jwt.verify(token, "Secret") as jwt.JwtPayload;
        return infos;
    } catch (e) {
        return undefined;
    }
}

export function backPlaylistAdd(app: express.Application) {
    app.get('/playlist/add', middleWare, (req, res) => {
        const token = req.header("token");
        var userInfo = getUserInfoFromToken(token || "");

        if (!userInfo || !userInfo.email) res.status(StatusCodes.BAD_GATEWAY).send("Error while getting token");

        res.status(StatusCodes.OK).send("Music added in the playlist");
    });
}
