import { Genres, Prisma } from '@prisma/client';
import prisma from './client';

type CreateArtists = {
    name: string
    userId: string
    genre: Genres
};

export async function createArtists(data: CreateArtists) {
    const users = await prisma.artists.create({
        data: {
            name: data.name,
            usersId: data.userId,
            genre: data.genre
        },
    });
}
