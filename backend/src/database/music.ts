import { Genres, Prisma } from '@prisma/client';
import prisma from './client';

export type CreateMusic = {
    name: string
    artistId: string
    genre: Genres
    userId: string
};

export async function createMusic(data: CreateMusic) {
    const createmusics = await prisma.musics.create({
        data: {
            name: data.name,
            artistsId: data.artistId,
            genre: data.genre,
            usersId: data.userId
        },
    });
}

export async function getMusic(data: CreateMusic) {
    const getmusics = await prisma.musics.findMany({
        where: { name: data.name }
    });
}

export async function deleteMusic(data: CreateMusic) {
    const deletemusics = await prisma.musics.deleteMany({
        where: { name: data.name }
    });
}
