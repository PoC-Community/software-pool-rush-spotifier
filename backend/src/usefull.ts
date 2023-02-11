type Music = {
    id:         number;
    name:       string;
    artists:    Artist[];
    playlist:   Playlist;
    played:     number;
    genre:      Genre;
}

type Artist = {
    id:         number;
    name:       string;
    musics:     Music[];
}

type Playlist = {
    id:         number;
    name:       string;
    musics:     Music[];
}

type UserData = {
    // Genres ici
}

export type MyUser = {
    email?:             string;
    username?:          string;
    password?:          string;
    musicsLiked?:       Music[];
    playlistsLiked?:    Playlist[];
    data?:              UserData;
}

enum Genre {
    POP,
    ROCK,
    RAP,
    JAZZ,
    CLASSIC
}

export let data: MyUser[] = [];