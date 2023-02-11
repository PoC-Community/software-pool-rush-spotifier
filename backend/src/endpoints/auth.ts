import express from "express";
import { StatusCodes } from "http-status-codes";
import z from "zod"
import bcrypt from "bcrypt"

import { MyUser, data } from "../usefull";


const salt = "$2b$10$7M09q7sLDmAsGM8BMu8Mhu";

function pleaseHashMeThat(password: string): string
{
    var hash = bcrypt.hashSync(password, salt);
    return hash;
}

function middleWare(req: express.Request, res: express.Response, next: express.NextFunction)
{
    const shematic = z.object({
        email: z.string(),
        password: z.string()
    });

    try {
        shematic.parse(req.body);
        next();
    } catch (err) {
        console.log("[Login/Register] Bad Request");
        res.status(StatusCodes.BAD_REQUEST).send("Email / Password not valid");
    }
}

export function backLogin(app: express.Application)
{
    app.post('/login', middleWare, (req, res) => {

        const hash = pleaseHashMeThat(req.body.password);

        const isFound = data.find((e) => e.email === req.body.email && e.password === req.body.password);

        if (isFound) {
            const object = {
                token: "Token",
                profile: req.body,
                message: "Logged In"
            }
            res.status(StatusCodes.ACCEPTED).send(object);
        } else res.status(StatusCodes.ACCEPTED).send("Not Founded");
    });
}

export function backRegister(app: express.Application)
{
    app.post('/register', middleWare, (req, res) => {
        
        const isFound = data.find((e) => e.email === req.body.email);

        if (!isFound) {
            let newUser: MyUser = {};
            newUser.email = req.body.email;
            newUser.password = req.body.password;
            data.push(newUser);

            const object = {
                token: "Token",
                profile: req.body,
                message: "Registered"
            }
            res.status(StatusCodes.ACCEPTED).send(object);
        } else res.status(StatusCodes.ACCEPTED).send("Username already taken");
    });
}
