import express from "express"
import z from "zod"
import { StatusCodes } from "http-status-codes";
import jwt, { JwtPayload } from "jsonwebtoken";
import { data, MyUser, Playlist } from "../usefull";
import { UserInfo } from "os";

function middleWare(req: express.Request, res: express.Response, next: express.NextFunction)
{
    try {
        z.string().parse(req.header("token"));
        z.string().parse(req.header("name"));
        z.string().optional().parse(req.header("id"));
        next();
    } catch (err) {
        console.log("[Playlist] Bad Request");
        res.status(StatusCodes.BAD_REQUEST).send("Error while getting the music");
    }
}

function getUserInfoFromToken(token: string): jwt.JwtPayload | undefined
{
    try {
        const infos = jwt.verify(token, "Secret") as jwt.JwtPayload;
        return infos;
    } catch (e) {
        return undefined;
    }
}

export function playlistAdd(app: express.Application) {
    app.get('/playlist/add', middleWare, (req, res) => {
        const token = req.header("token");

        let tmp: any = getUserInfoFromToken(token || "");
        if (!tmp || !tmp.email) res.status(StatusCodes.BAD_GATEWAY).send("Error while getting token");
        let userInfo = tmp as JwtPayload;

        

        res.status(StatusCodes.OK).send("Music added in the playlist");
    });
}

export function playlistCreate(app: express.Application) {
    app.get('/playlist/create', middleWare, (req, res) => {
        const token = req.header("token");

        let tmp: any = getUserInfoFromToken(token || "");
        if (!tmp || !tmp.email) res.status(StatusCodes.BAD_GATEWAY).send("Error while getting token");
        let userInfo = tmp as JwtPayload;

        tmp = data.find((e) => e.email === userInfo.email);
        if (!tmp) res.status(StatusCodes.BAD_GATEWAY).send("Error while searching for user");
        let userData = tmp as MyUser;

        let newPlaylist: Playlist = {};
        newPlaylist.name = req.header("name");
        newPlaylist.musics = [];

        userData.playlists?.push(newPlaylist);

        console.log(userData);
        res.status(StatusCodes.OK).send(`Playlist ${req.header("name")} created`);
    });
}