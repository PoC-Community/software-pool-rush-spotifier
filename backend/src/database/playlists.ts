import prisma from './client';

type CreatePlaylist = {
    name: string
    userId: string
};

export async function createPlaylist(data: CreatePlaylist) {
    const playlists = await prisma.playlists.create({
        data: {
            name: data.name,
            usersId: data.userId
        },
    });
}
