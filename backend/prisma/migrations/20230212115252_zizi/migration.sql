-- CreateEnum
CREATE TYPE "Genres" AS ENUM ('POP', 'ROCK', 'RAP', 'CLASSIC', 'HIPHOP', 'JAZZ');

-- CreateTable
CREATE TABLE "Users" (
    "id" UUID NOT NULL,
    "email" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "style" "Genres"[],

    CONSTRAINT "Users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Artists" (
    "id" UUID NOT NULL,
    "name" TEXT NOT NULL,
    "genre" "Genres"[],
    "usersId" UUID,

    CONSTRAINT "Artists_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Musics" (
    "id" UUID NOT NULL,
    "name" TEXT NOT NULL,
    "genre" "Genres"[],
    "artistsId" UUID NOT NULL,
    "playlistId" UUID,
    "usersId" UUID,

    CONSTRAINT "Musics_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Playlists" (
    "id" UUID NOT NULL,
    "name" TEXT NOT NULL,
    "usersId" UUID,

    CONSTRAINT "Playlists_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Users_email_key" ON "Users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Artists_name_key" ON "Artists"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Musics_name_key" ON "Musics"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Playlists_name_key" ON "Playlists"("name");

-- AddForeignKey
ALTER TABLE "Artists" ADD CONSTRAINT "Artists_usersId_fkey" FOREIGN KEY ("usersId") REFERENCES "Users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Musics" ADD CONSTRAINT "Musics_artistsId_fkey" FOREIGN KEY ("artistsId") REFERENCES "Artists"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Musics" ADD CONSTRAINT "Musics_playlistId_fkey" FOREIGN KEY ("playlistId") REFERENCES "Playlists"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Musics" ADD CONSTRAINT "Musics_usersId_fkey" FOREIGN KEY ("usersId") REFERENCES "Users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Playlists" ADD CONSTRAINT "Playlists_usersId_fkey" FOREIGN KEY ("usersId") REFERENCES "Users"("id") ON DELETE SET NULL ON UPDATE CASCADE;
