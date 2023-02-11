import express from "express"
import z from "zod"
import { StatusCodes } from "http-status-codes";
import jwt, { JwtPayload } from "jsonwebtoken";
import { data, MyUser, Playlist } from "../usefull";

function middleWare(req: express.Request, res: express.Response, next: express.NextFunction) {
    try {
        z.string().parse(req.header("token"));
        z.string().parse(req.body.name);
        z.string().optional().parse(req.body.id);
        next();
    } catch (err) {
        console.log("[Playlist] Bad Request");
        res.status(StatusCodes.BAD_REQUEST).send("Error while getting the music");
    }
}

function getUserInfoFromToken(token: string): jwt.JwtPayload | undefined {
    try {
        const infos = jwt.verify(token, "Secret") as jwt.JwtPayload;
        return infos;
    } catch (e) {
        return undefined;
    }
}

export function playlistAdd(app: express.Application) {
    app.post('/playlist/add', middleWare, (req, res) => {
        const token = req.header("token");
        const name = req.body.name;
        const id = req.body.id;

        // Check si le token recupere bien les userInfos
        const userInfo = getUserInfoFromToken(token || "");
        if (!userInfo || !userInfo.email) {
            res.status(StatusCodes.BAD_REQUEST).send("Error while getting token");
            return;
        }

        // Recupere les données de l'utilisateur via userInfo
        const userData = data.find((e) => e.email === userInfo.email);
        if (!userData) {
            res.status(StatusCodes.BAD_REQUEST).send("Error while searching for user");
            return;
        }

        // Check si le nom de la playlist existe
        const myPlaylist = userData.playlists?.find((e) => name === e.name);
        if (!myPlaylist) {
            res.status(StatusCodes.BAD_REQUEST).send("Error playlist dont exist");
            return;
        }

        // Check si l'ID de la musique est bien dans la requete
        if (!id || !Number(id)) {
            res.status(StatusCodes.BAD_REQUEST).send("Error music don't exist");
            return;
        }

        myPlaylist.musics?.push(Number(id));

        console.log(myPlaylist);
        res.status(StatusCodes.OK).send("Music added in the playlist");
    });
}

export function playlistCreate(app: express.Application) {
    app.post('/playlist/create', middleWare, (req, res) => {
        const token = req.header("token");
        const name = req.body.name;

        const userInfo = getUserInfoFromToken(token || "");
        if (!userInfo || !userInfo.email) {
            res.status(StatusCodes.BAD_REQUEST).send("Error while getting token");
            return;
        }

        const userData = data.find((e) => e.email === userInfo.email);
        if (!userData) {
            res.status(StatusCodes.BAD_REQUEST).send("Error while searching for user");
            return;
        }

        const myPlaylist = userData.playlists?.find((e) => name === e.name);
        if (myPlaylist) {
            res.status(StatusCodes.BAD_REQUEST).send("Error playlist already exist");
            return;
        }

        let newPlaylist: Playlist = {};
        newPlaylist.name = name;
        newPlaylist.musics = [];

        userData.playlists?.push(newPlaylist);

        console.log(userData);
        res.status(StatusCodes.OK).send(`Playlist ${name} created`);
    });
}
