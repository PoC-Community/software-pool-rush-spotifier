import { Genres, Prisma } from '@prisma/client';
import prisma from './client';

type CreateMusic = {
    name: string
    artistId: string
    genre: Genres
    userId: string
};

export async function createMusic(data: CreateMusic) {
    const musics = await prisma.musics.create({
        data: {
            name: data.name,
            artistsId: data.artistId,
            genre: data.genre,
            usersId: data.userId
        },
    });
}
