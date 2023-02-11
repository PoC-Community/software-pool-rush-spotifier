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

export async function getPlaylist(data: CreatePlaylist) {
    const playlists = await prisma.playlists.findMany({
        where: {
            name: data.name,
            usersId: data.userId
        }
    });
}

export async function deletePlaylist(data: CreatePlaylist) {
    const deletelists = await prisma.playlists.deleteMany({
        where: {
            name: data.name,
            usersId: data.userId
        }
    });
}
