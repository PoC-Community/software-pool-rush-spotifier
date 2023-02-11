import prisma from './client';

type CreateUser = {
    email: string
    username: string
    password: string
};

export async function createUser(data: CreateUser) {
    const users = await prisma.users.create({
        data: {
            email: data.email,
            username: data.username,
            password: data.password,
        },
    });
}
