import express from "express";
import { StatusCodes } from "http-status-codes";
import z from "zod"
import bcrypt from "bcrypt"
import jwt from "jsonwebtoken"

import { MyUser, data } from "../usefull";
import { CreateUser, createUser, getUser } from "../database/user";


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
        password: z.string(),
        username: z.string()
    });

    try {
        shematic.parse(req.body);
        next();
    } catch (err) {
        console.log("[Auth] Bad Request");
        res.status(StatusCodes.BAD_REQUEST).send("Email/Password/Username not valid");
    }
}

export function backLogin(app: express.Application)
{
    app.post('/login', middleWare, async (req, res) => {

        const hash = pleaseHashMeThat(req.body.password);

        const isFound = await getUser(req.body.email);

        if (isFound) {
            const object = {
                token: jwt.sign(req.body, "Secret"),
                profile: req.body,
                message: "Logged In"
            }
            res.status(StatusCodes.ACCEPTED).send(object);
        } else res.status(StatusCodes.CONFLICT).send("Not Founded");
    });
}

export function backRegister(app: express.Application)
{
    app.post('/register', middleWare, (req, res) => {

        const isFound = data.find((e) => e.email === req.body.email);

        if (!isFound) {
            let newUser: CreateUser = { email: req.body.email, username: req.body.username, password: req.body.password };
            createUser(newUser);

            const object = {
                token: jwt.sign(req.body, "Secret"),
                profile: req.body,
                message: "Registered"
            }
            res.status(StatusCodes.CREATED).send(object);
        } else res.status(StatusCodes.CONFLICT).send("Username already taken");
    });
}
