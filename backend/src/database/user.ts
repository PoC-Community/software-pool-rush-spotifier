import { Users } from '@prisma/client';
import prisma from './client';

export type CreateUser = {
    email: string
    username: string
    password: string
};

export async function createUser(data: CreateUser) {
    const createusers = await prisma.users.create({
        data: {
            email: data.email,
            username: data.username,
            password: data.password,
        },
    });
}

export async function getUser(email: string): Promise<Users | null> {

    const getusers = await prisma.users.findUnique({
        where: {
            email: email
        }
    });
    return getusers;
}

export async function deleteUser(data: CreateUser) {
    const deleteusers = await prisma.users.deleteMany({
        where: {
            email: data.email,
            username: data.username,
            password: data.password
        }
    });
}
