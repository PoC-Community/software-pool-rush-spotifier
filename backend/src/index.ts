import cookieParser from "cookie-parser";
import express from "express";
import { StatusCodes } from "http-status-codes";
import dotenv from "dotenv";

import { backPlay } from "./endpoints/play";
import { backLogin, backRegister } from "./endpoints/auth";
import { playlistAdd, playlistCreate } from "./endpoints/playlists";

dotenv.config();

function server() {
    const port = process.env.API_PORT || 3000;
    const app = express();

    app.all('/health', (_, res) => {
        res.status(StatusCodes.OK).send("Everything is on");
    });

    app.listen(port, () => {
        console.log(`App runs on port ${port}.\n`)
    });

    app.use(express.json());
    app.use(cookieParser());

    backLogin(app);
    backPlay(app);
    backRegister(app);
    playlistAdd(app);
    playlistCreate(app);
}

server()