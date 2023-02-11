import { Genres, Prisma } from '@prisma/client';
import prisma from './client';

export type CreateArtists = {
    name: string
    userId: string
    genre: Genres
};

export async function createArtists(data: CreateArtists) {
    const createartists = await prisma.artists.create({
        data: {
            name: data.name,
            usersId: data.userId,
            genre: data.genre
        },
    });
}

export async function getArtists(data: CreateArtists) {
    const getartists = await prisma.artists.findMany({
        where: { name: data.name }
    });
}

export async function deleteArtists(data: CreateArtists) {
    const deleteartists = await prisma.artists.deleteMany({
        where: { name: data.name }
    });
}
