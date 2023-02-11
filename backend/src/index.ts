import cookieParser from "cookie-parser";
import express from "express";
import { StatusCodes } from "http-status-codes";

import { backPlay } from "./endpoints/play";
import { backLogin, backRegister } from "./endpoints/auth";


function server() {
    const port = 3000;
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
}

server()
