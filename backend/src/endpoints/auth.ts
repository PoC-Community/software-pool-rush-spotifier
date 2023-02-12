import express from "express";
import { StatusCodes } from "http-status-codes";
import z from "zod"
import bcrypt from "bcrypt"
import jwt from "jsonwebtoken"

import { CreateUser, createUser, getUser } from "../database/user";


const salt = "$2b$10$7M09q7sLDmAsGM8BMu8Mhu";

function pleaseHashMeThat(password: string): string
{
    var hash = bcrypt.hashSync(password, salt);
    return hash;
}

function middleWare(req: express.Request, res: express.Response, next: express.NextFunction)
{
    try {
        z.string().parse(req.body.email);
        z.string().parse(req.body.password);
        z.string().optional().parse(req.body.username);
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
                profile: isFound,
                message: "Logged In"
            }
            res.status(StatusCodes.ACCEPTED).send(object);
        } else res.status(StatusCodes.CONFLICT).send("Not Founded");
    });
}

export function backRegister(app: express.Application)
{
    app.post('/register', middleWare, async (req, res) => {

        const isFound = await getUser(req.body.email);
        console.log(isFound);

        if (isFound === null && req.body.username) {
            let newUser: CreateUser = { email: req.body.email, username: req.body.username, password: req.body.password };
            createUser(newUser);

            const object = {
                token: jwt.sign(req.body, "Secret"),
                profile: newUser,
                message: "Registered"
            }
            res.status(StatusCodes.CREATED).send(object);
        } else res.status(StatusCodes.CONFLICT).send("Username already taken");
    });
}