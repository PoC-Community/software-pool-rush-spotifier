import prisma from './client';

type CreateUser = {
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

export async function getUser(data: CreateUser) {
    const getusers = await prisma.users.findMany({
        where: {
            email: data.email,
            username: data.username,
            password: data.password
        }
    });
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
